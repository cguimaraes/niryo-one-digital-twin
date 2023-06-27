#!/bin/bash

ROS_MASTER_URI="http://127.0.0.1:11311"

podman run \
    --pod niryo-one \
    --name niryo-one-motion \
    --hostname niryo-one-motion \
    -it \
    --rm \
    --uts private \
    -e ROS_MASTER_URI=$ROS_MASTER_URI \
    niryo-one-motion:latest

