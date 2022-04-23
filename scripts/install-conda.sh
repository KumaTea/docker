#!/usr/bin/env bash

set -e

# wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh -O /tmp/install-conda.sh
echo "Downloading Miniforge (conda) installer script..."
wget http://192.168.2.225:8080/Miniforge3-Linux-aarch64.sh -O /tmp/install-conda.sh

echo "Installing conda..."
bash /tmp/install-conda.sh -b -p /opt/conda

echo "Basic configuration..."
CONDA_EXE=/opt/conda/bin/conda
$CONDA_EXE init bash
source /root/.bashrc > /dev/null
$CONDA_EXE config --set show_channel_urls false

echo "Setting PyPI mirror..."
export PYTHON_BIN=/opt/conda/bin/python3
$PYTHON_BIN -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

echo "Cleanup..."
$CONDA_EXE clean --all -y
rm -rf /tmp/install-conda.sh
rm -rf /root/.cache/* || echo "No cache in .cache"
