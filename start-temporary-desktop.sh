#!/bin/bash

docker run --rm -ti -p 5901:5901 --privileged=true --security-opt seccomp:unconfined --device /dev/dri -v /dev/shm:/dev/shm docker-desktop
