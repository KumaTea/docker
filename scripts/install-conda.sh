#!/usr/bin/env bash

set -ex

# wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh -O /tmp/install-conda.sh
wget http://192.168.2.225:8080/Miniforge3-Linux-aarch64.sh -O /tmp/install-conda.sh
bash /tmp/install-conda.sh -b -p /opt/conda

export CONDA_EXE=/opt/conda/bin/conda
$CONDA_EXE init bash
source /root/.bashrc > /dev/null
$CONDA_EXE config --set show_channel_urls false

export PYTHON_BIN=/opt/conda/bin/python3
$PYTHON_BIN -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

rm -rf /tmp/install-conda.sh
rm -rf /root/.cache/* || echo "No cache in .cache"
