#!/bin/bash
docker run \
   	-it \
	--gpus all \
   	--privileged \
   	--shm-size=6G \
   	-u $(id -u):$(id -g) \
   	-e CARLA_SERVER=/home/software/CARLA/CarlaUE4.sh \
   	-e CARLA_OUT=./carla_out \
   	-e XAUTHORITY=$XAUTHORITY \
   	-e DISPLAY=$DISPLAY \
   	-e SDL_VIDEODRIVER=offscreen \
   	-v /tmp/.X11-unix:/tmp/.X11-unix \
   	-v $PWD/ray_results:/ray_results \
   	-v $PWD/macad-agents:/macad-agents \
   	-w /macad-agents/src \
  	macad-agents:latest python -m macad_agents.rllib.ppo_multiagent_shared_weights
