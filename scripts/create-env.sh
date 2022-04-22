#!/usr/bin/env bash

set -ex

ENV_NAME=${1:-"bot"}
PACKAGES=${2:-"pip setuptools wheel"}
PIP_PACKAGES=${3:-""}


source /root/.bashrc > /dev/null
CONDA_EXE=/opt/conda/bin/conda
$CONDA_EXE create -n "$ENV_NAME" python=3.9 "$PACKAGES" -y
# $CONDA_EXE activate tg > /dev/null

if [ -n "$PIP_PACKAGES" ]; then
    CONDA_TG="/opt/conda/envs/$ENV_NAME/bin/python3"
    $CONDA_TG -m pip install -U "$PIP_PACKAGES"
fi


rm -rf /root/.cache/* || echo "No cache in .cache"
