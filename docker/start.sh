#! /bin/bash
# --net host \
# -p 20000:22 \
# -v /eva_data/eva_sean:/data \
docker run -it \
    --name ub \
    -v $(pwd):/workspace \
    --net host \
    --gpus all \
    ub zsh
