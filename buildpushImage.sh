#!/bin/bash

: ${IMAGE:?"Need to set IMAGE, e.g. gcr.io/coreos-k8s-scale-testing/etcd"}
echo "building binary"
GOOS=linux GOARCH=amd64 ./build
echo "building image"
docker build -t $IMAGE -f Dockerfile-release .
echo "pushing image"
docker push $IMAGE