from __future__ import absolute_import, division, print_function

import json
import multiprocessing
import os

import GPUtil
import ray
from macad_gym.carla.multi_env import DEFAULT_MULTIENV_CONFIG, MultiCarlaEnv
from macad_gym.carla.scenarios import update_scenarios_parameter
from ray.tune import register_env, register_trainable, run_experiments

from macad_agents.rllib.models import register_carla_model

from .continuous_A3C_base import ContinuousA3CTune

cpu = multiprocessing.cpu_count() / 2
if cpu < 1:
    cpu = 1

gpu = 0
gpu_info = GPUtil.getGPUs()
if gpu_info is not None and len(gpu_info) > 0:
    gpu = len(gpu_info)

env_name = "carla_env"
env_config = DEFAULT_MULTIENV_CONFIG
config_update = update_scenarios_parameter(
    json.load(open("macad_agents/a3c/env_config.json"))
)
env_config.update(config_update)

register_env(env_name, lambda env_config: MultiCarlaEnv(env_config))
register_carla_model()

register_trainable("continuous_A3C", ContinuousA3CTune)

ray.init()

save_model_dir = os.path.expanduser("~/saved_models/tdac/continuous_A3C/")
if not os.path.exists(save_model_dir + "global/"):
    os.makedirs(save_model_dir + "global/")
if not os.path.exists(save_model_dir + "local/"):
    os.makedirs(save_model_dir + "local/")

last_checkpoint = None
# try:
#    last_checkpoint = max(glob.glob(save_model_dir+"local/*"),
#  key=os.path.getctime)
#    self.lnet.load_state_dict(torch.load(last_checkpoint))
#    print("Loaded saved local model:",last_checkpoint)
# except:
#    pass

MAX_EP = 10000000  # 10M

run_experiments(
    {
        "carla-continuous-a3c": {
            "run": "continuous_A3C",
            "env": "carla_env",
            "trial_resources": {"cpu": cpu, "gpu": gpu, "extra_gpu": 0},
            "stop": {"training_iteration": MAX_EP},
            "config": {
                "env_config": env_config,
                "gamma": 0.9,
                "num_workers": 1,
                "num_local_workers": 3,
                "save_checkpoint_path": save_model_dir,
                "load_checkpoint_path": last_checkpoint,
                "MAX_EP": MAX_EP,
                "MAX_EP_STEP": 2000,
                "SAVE_STEP": 2000000,
                "UPDATE_GLOBAL_ITER": 5,
            },
        },
    }
)
