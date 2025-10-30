#! /bin/bash
# --net host \
# -p 20000:22 \
# -v /eva_data/eva_sean:/data \


docker run -it \
    --name sean_env \
    -v /home/eva_sean:/workspace \
    -v /eva_data/eva_sean:/data \
    --net host \
    --gpus all \
    sean_env
