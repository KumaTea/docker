#!/usr/bin/env bash

set -e

ENV_NAME=${1:-"bot"}
PACKAGES=${2:-"pip setuptools wheel"}
PIP_PACKAGES=${3:-""}

echo "Activating env: $ENV_NAME"
source /root/.bashrc > /dev/null
CONDA_EXE=/opt/conda/bin/conda
$CONDA_EXE activate "$ENV_NAME"

echo "Installing conda packages: $PACKAGES"
$CONDA_EXE install -y $PACKAGES

if [ -n "$PIP_PACKAGES" ]; then
  echo "Installing pip packages: $PIP_PACKAGES"
  CONDA_TG="/opt/conda/envs/$ENV_NAME/bin/python3"
  $CONDA_TG -m pip install -U $PIP_PACKAGES
fi

echo "Cleanup..."
$CONDA_EXE clean --all -y
$CONDA_EXE activate "$ENV_NAME" > /dev/null || source activate "$ENV_NAME"  > /dev/null
$CONDA_EXE clean --all -y
rm -rf /root/.cache/* || echo "No cache in .cache"
