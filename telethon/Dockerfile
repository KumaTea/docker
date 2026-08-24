# Basic Telegram Bot Configuration

FROM kumatea/bot:alpine

ARG PIP_PKGS="uvloop cryptg telethon"

# Install Python packages
RUN set -ex && \
    pip install $PIP_PKGS --prefer-binary --no-cache-dir && \
    (rm -rf /root/.cache || echo "No cache in .cache")

# Set entrypoint
ENTRYPOINT ["/bin/sh"]
