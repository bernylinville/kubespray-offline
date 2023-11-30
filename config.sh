#!/bin/bash

# Kubespray version to download. Use "master" for latest master branch.
KUBESPRAY_VERSION=${KUBESPRAY_VERSION:-2.23.1}
#KUBESPRAY_VERSION=${KUBESPRAY_VERSION:-master}

# container runtime for preparation node
# docker=${docker:-docker}
docker=${docker:-/usr/local/bin/nerdctl}

# Run ansible in container?
ansible_in_container=${ansible_in_container:-true}

http_proxy=${http_proxy:-http://10.0.12.103:7890}