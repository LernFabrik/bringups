#!/bin/bash
set -e
IMAGE_NAME=iwtros-kinetic
git clone https://github.com/iwtros/iwtros_framework.git ../tmp_iwtros_framework &&
cd ../tmp_iwtros_framework && git checkout master &&
cd ../iwtros_framework
docker build -t $IMAGE_NAME:base -f Dockerfile.base ../
docker build --build-arg DOCKER_BASE_IMAGE=$IMAGE_NAME:base -t $IMAGE_NAME:desktop -f Dockerfile.desktop ../
docker build --build-arg DOCKER_BASE_IMAGE=$IMAGE_NAME:desktop -t $IMAGE_NAME:dev -f Dockerfile.iwtros ../
trash ../tmp_iwtros_framework
