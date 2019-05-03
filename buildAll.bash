#!/bin/bash
IMAGE_NAME=iwtros-kinetic
docker build -t $IMAGE_NAME:base -f Dockerfile.base .
docker build --build-arg DOCKER_BASE_IMAGE=$IMAGE_NAME:base -t $IMAGE_NAME:desktop -f Dockerfile.desktop .
docker build --build-arg DOCKER_BASE_IMAGE=$IMAGE_NAME:desktop -t $IMAGE_NAME:dev -f Dockerfile.iwtros .

