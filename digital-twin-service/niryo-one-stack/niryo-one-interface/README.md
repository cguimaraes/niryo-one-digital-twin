# Niryo One Interface layer

## What is it?

This repository contains the files to run a Niryo One Interface layer in docker container. 

## What does this container do?

This container runs the `tf2_web_republisher`,  `rosbridge_websocket`, `niryo_one_commander`, `joy_node` and `user_interface` ROS nodes. 

## Run it  

### Dependencies:
- The Niryo One Interface depends on:
    - master (tutorial [here](../../ros-master/)).
    - sim-drivers (tutorial [here](../../niryo-one-drivers/simulation/)).
    - control (tutorial [here](../niryo-one-control/)).
    - motion (tutorial [here](../niryo-one-motion/)).
 
note: be sure that all the dependencies are running before you run the Niryo One Interface container

### First you will need to build the container. In order to do that, run the build.sh script as sudo:
- `sudo ./build.sh`
- note: It will take some time to build the image because we have to assemble a ROS melodic image, install the Niryo One dependencies and install the Niryo One ROS  

### This will build the `niryo-one-interface` docker image. Verify that the image is present by running:
- `sudo docker image ls`

### Docker run example
In this folder we also provide a docker run example. 

The run_example.sh is optimized to running the Digital Twin service on a single host. For that reason it uses the docker host network and all the remaning modules (e.g., master, control, motion planning ) of the Digital Twin service are added on 127.0.0.1.

To run the Niryo One Interface:
- `sudo ./run_example.sh`
- Verify that the container is up and running:
    - `sudo docker ps` - in the output you should be able to see the `interface` container up and running`
