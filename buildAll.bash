#!/bin/bash
IMAGE_NAME=iwtros-melodic
BRINGUPS_PATH=$PWD
cd ../../../
docker build -t $IMAGE_NAME:base -f $BRINGUPS_PATH/Dockerfile.base .
docker build --build-arg DOCKER_BASE_IMAGE=$IMAGE_NAME:base -t $IMAGE_NAME:desktop -f $BRINUPS_PATH/Dockerfile.desktop .
docker build --build-arg DOCKER_BASE_IMAGE=$IMAGE_NAME:desktop -t $IMAGE_NAME:dev -f $BRINGUPS_PATH/Dockerfile.iwtros .
