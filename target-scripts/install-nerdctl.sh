#!/bin/bash

source ./config.sh

ENABLE_DOWNLOAD=${ENABLE_DOWNLOAD:-false}

if [ ! -e files ]; then
    mkdir -p files
fi

FILES_DIR=./files
if $ENABLE_DOWNLOAD; then
    FILES_DIR=./tmp/files
    mkdir -p $FILES_DIR
fi

# download files, if not found
download() {
    url=$1
    dir=$2

    filename=$(basename $1)
    mkdir -p ${FILES_DIR}/$dir

    if [ ! -e ${FILES_DIR}/$dir/$filename ]; then
        echo "==> download $url"
        (cd ${FILES_DIR}/$dir && curl -SLO $1)
    fi
}

if $ENABLE_DOWNLOAD; then
    # TODO: These version must be same as kubespray. Refer `roles/downloads/defaults/main.yml` of kubespray.
    NERDCTL_FULL_VERSION=1.7.0

    download https://github.com/containerd/nerdctl/releases/download/v${NERDCTL_FULL_VERSION}/nerdctl-full-${NERDCTL_FULL_VERSION}-linux-amd64.tar.gz
else
    FILES_DIR=./files
fi

select_latest() {
    local latest=$(ls $* | tail -1)
    if [ -z "$latest" ]; then
        echo "No such file: $*"
        exit 1
    fi
    echo $latest
}

# Install nerdctl
echo "==> Install nerdctl"
sudo tar xvf $(select_latest "${FILES_DIR}/nerdctl-full-*-linux-amd64.tar.gz") -C /usr/local

# Install containerd
echo "==> Start containerd"
sudo systemctl daemon-reload
sudo systemctl enable --now containerd

# Install buildkit
echo "==> Start buildkit"
sudo systemctl enable --now buildkit
