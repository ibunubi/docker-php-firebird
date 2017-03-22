#!/bin/bash
built_id=${1}
docker run -d --name zo-html -p 8081:80 -v /Volumes/DATA/docker-lab/zo-env/build/html:/usr/share/nginx/html ${built_id}