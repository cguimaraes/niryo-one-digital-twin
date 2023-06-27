#!/bin/bash

python2 ./ros-middleware.py &

sleep 10

python3 -O ./httpd.py
