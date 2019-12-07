### MACAD-Agents

Multi-Agent algorithms for Multi-Agent Connected Autonomous Driving using [MACAD-Gym](https://github.com/praveen-palanisamy/macad-gym)

#### How to train/test MACAD-Agents?

0. Build the MACAD-Agents Docker container: `docker build -f Dockerfile macad-agents/base:latest
1. git clone https://github.com/praveen-palanisamy/macad-agents
2. Pick from one of the available multi-agent algorithms:

  - To train multiple agents using PPO where the agents communicate/share learned weights, run:

    `docker run -it -v macad-agents:/macad-agents -w /macad-agents/src macad-agents/base python -m macad_agents.rllib.ppo_multiagent_shared_weights.py`

  - To train multiple agents using IMPALA where the agents communicate/share learned weights, run:
  
    `docker run -it -v macad-agents:/macad-agents -w /macad-agents/src macad-agents/base python -m macad_agents.rllib.impala_multiagent_shared_weights.py`
