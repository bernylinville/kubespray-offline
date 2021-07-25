#!/bin/bash

REGISTRY_IMAGE=${REGISTRY_IMAGE:-registry:2.7.1}
REGISTRY_DIR=${REGISTRY_DIR:-/var/lib/registry}
REGISTRY_PORT=${REGISTRY_PORT:-35000}

if [ ! -e $REGISTRY_DIR ]; then
    sudo mkdir $REGISTRY_DIR
fi

sudo docker run -d \
    -p ${REGISTRY_PORT}:5000 \
    --restart always \
    --name registry \
    -v $REGISTRY_DIR:/var/lib/registry \
    $REGISTRY_IMAGE