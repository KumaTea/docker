# Basic Telegram Bot Configuration

FROM kumatea/bot:latest

ENV PIP_PKGS="pyrogram uvloop tgcrypto"

# Create conda environment
RUN set -ex && \
    pip install $PIP_PKGS --prefer-binary && \
    rm -rf /root/.cache/*

# Set entrypoint
ENTRYPOINT ["/bin/bash"]
