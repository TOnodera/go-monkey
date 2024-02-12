#!/bin/bash

CONTAINER_NAME=go-monkey
echo $CONTAINER_NAME:v1 
docker build -t $CONTAINER_NAME:v1 . && docker run -it --rm --mount type=bind,source="$(pwd)",target=/home/goer $CONTAINER_NAME:v1 bash -c "source .profile && bash"
