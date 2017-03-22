#!/bin/bash
TAG_NAME=${1}
if [ -z "${TAG_NAME}" ]
  then
    echo "Error: Tag name required"
    exit 1
fi
docker build -t ibunubi/zo-env:${TAG_NAME} .