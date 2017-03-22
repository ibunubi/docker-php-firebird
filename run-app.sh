#!/bin/bash
built_id=${1}
docker run \
    -d \
    --name zo-app \
    -p 8082:80 \
    -p 3050:3050 \
    -v /Volumes/DATA/docker-lab/zo-env/build/app:/usr/share/nginx/html \
    -v /Volumes/DATA/docker-lab/zo-env/build/db:/data/zahir ${built_id}