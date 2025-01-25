#! /bin/bash

docker run -it \
    --name ub \
    -v $PWD:/workspace \
    --net host \
    --gpus all \
    ub bash