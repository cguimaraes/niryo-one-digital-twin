#!/bin/bash

ROS_MASTER_URI="http://127.0.0.1:11311"

podman run \
    --pod niryo-one \
    --name niryo-one-full-stack \
    --hostname niryo-one-full-stack \
    -it \
    --rm \
    --uts private \
    -e ROS_MASTER_URI=$ROS_MASTER_URI \
    niryo-one-full-stack:latest

