#!/bin/bash
IMAGE_NAME=ros-melodic
docker build -t $IMAGE_NAME:base -f Dockerfile.base .
docker build --build-arg DOCKER_BASE_IMAGE=$IMAGE_NAME:base -t $IMAGE_NAME:desktop -f Dockerfile.desktop .

