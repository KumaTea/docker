#!/usr/bin/env bash

set -e

PACKAGES=${1:-"pip setuptools wheel"}
PIP_PACKAGES=${2:-""}

source /root/.bashrc > /dev/null
CONDA_EXE=/opt/conda/bin/conda

echo "Installing conda packages: $PACKAGES"
$CONDA_EXE install -y $PACKAGES

if [ -n "$PIP_PACKAGES" ]; then
  echo "Installing pip packages: $PIP_PACKAGES"
  PYTHON_BIN=/opt/conda/bin/python3
  $PYTHON_BIN -m pip install -U $PIP_PACKAGES
fi

echo "Cleanup..."
$CONDA_EXE clean --all -y
rm -rf /root/.cache/* || echo "No cache in .cache"
