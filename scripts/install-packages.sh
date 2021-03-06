#!/usr/bin/env bash

set -e

PACKAGES=${1:-""}
PIP_PACKAGES=${2:-""}
CUSTOM_INDEX_URL=${3:-""}

source /root/.bashrc > /dev/null
CONDA_EXE=/opt/conda/bin/conda

if [ -n "$PACKAGES" ]; then
  echo "Installing conda packages: $PACKAGES"
  $CONDA_EXE install -y $PACKAGES
fi

if [ -n "$PIP_PACKAGES" ]; then
  echo "Installing pip packages: $PIP_PACKAGES"
  PYTHON_BIN=/opt/conda/bin/python3
  if [ -n "$CUSTOM_INDEX_URL" ]; then
    $PYTHON_BIN -m pip install $PIP_PACKAGES -f $CUSTOM_INDEX_URL
  else
    $PYTHON_BIN -m pip install $PIP_PACKAGES
  fi
fi

echo "Cleanup..."
$CONDA_EXE clean --all -y
rm -rf /root/.cache/* || echo "No cache in .cache"
