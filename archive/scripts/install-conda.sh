#!/usr/bin/env bash

set -e

ARCH=$(uname -m)

echo "Downloading Miniforge (conda) installer script..."
URL="https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-$ARCH.sh"
URL="https://gh.kmtea.eu/$URL"
wget "$URL" -O /tmp/install-conda.sh

echo "Installing conda..."
bash /tmp/install-conda.sh -b -p /opt/conda

echo "Basic configuration..."
CONDA_EXE=/opt/conda/bin/conda
$CONDA_EXE init bash
source /root/.bashrc > /dev/null
$CONDA_EXE config --set show_channel_urls false

echo "Setting PyPI mirror..."
PYTHON_BIN=/opt/conda/bin/python3
$PYTHON_BIN -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
$PYTHON_BIN -m pip config set global.extra-index-url https://ext.kmtea.eu/cdn

echo "Cleanup..."
$CONDA_EXE clean --all -y
rm -rf /tmp/install-conda.sh
rm -rf /root/.cache/* || echo "No cache in .cache"
