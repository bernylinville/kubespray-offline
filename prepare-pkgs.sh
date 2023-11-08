#!/bin/bash

echo "==> prepare-pkgs.sh"

. /etc/os-release
. ./scripts/common.sh

case "$NAME" in
    openEuler*)
        if [[ "${VERSION_ID}" == "22.03" ]]; then
            $sudo dnf install -y python3 python3-pip python3-devel dnf-utils dnf-plugins-core createrepo wget || exit 1
        fi
        ;;
    *)
        echo "Unknown NAME: $NAME"
        exit 1
        ;;
esac
