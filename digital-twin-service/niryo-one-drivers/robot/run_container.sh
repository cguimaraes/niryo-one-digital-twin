#!/bin/bash

ROS_MASTER_URI="http://168.254.200.200:11311"

podman run \
    --pod niryo-one \
    --name niryo-one-drivers
    --hostname niryo-one-drivers \
    -itd \
    --rm \
    --uts private \
    -e ROS_MASTER_URI=$ROS_MASTER_URI \
    --device /dev/gpiomem \
    --device /dev/spidev0.0 \
    --device /dev/spidev0.1 \
    --device /dev/serial0 \
    --device /dev/serial1 \
    niryo-one-drivers:latest

