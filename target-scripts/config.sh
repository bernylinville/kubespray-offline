#!/bin/bash
# Kubespray version to download. Use "master" for latest master branch.
KUBESPRAY_VERSION=${KUBESPRAY_VERSION:-2.27.0}
#KUBESPRAY_VERSION=${KUBESPRAY_VERSION:-master}

# These version must be same as kubespray.
# Refer `roles/kubespray-defaults/defaults/main/download.yml` of kubespray.
RUNC_VERSION=1.2.3
CONTAINERD_VERSION=1.7.24
NERDCTL_VERSION=1.7.7
CNI_VERSION=1.4.0

# Some container versions, must be same as ../imagelists/images.txt
NGINX_VERSION=1.27.3
REGISTRY_VERSION=2.8.2

# container registry port
REGISTRY_PORT=${REGISTRY_PORT:-35000}
