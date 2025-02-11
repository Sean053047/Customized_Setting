#! /bin/bash

docker build --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    --build-arg UNAME=eva_sean \
    -f docker/Dockerfile_ros \
    -t ub .