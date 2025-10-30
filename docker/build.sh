#! /bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <Dockerfile_path> <image_name>"
    exit 1
fi
if [ ! -f "$1" ]; then
    echo "Dockerfile not found at: $1"
    exit 1
fi
DOCKERFILE_PATH="$1"
IMAGE_NAME="$2"
docker build --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    --build-arg UNAME=eva_sean \
    -f "$DOCKERFILE_PATH" \
    -t "$IMAGE_NAME" $(pwd)