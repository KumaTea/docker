# Basic Telegram Bot Configuration

FROM kumatea/bot:alpine

ENV PIP_PKGS="uvloop tgcrypto"
ENV PYROGRAM_FORK_URL="https://github.com/KurimuzonAkuma/pyrogram/archive/dev.zip"

# Create conda environment
RUN set -ex && \
    pip install $PIP_PKGS --prefer-binary --no-cache-dir && \
    pip install $PYROGRAM_FORK_URL --no-cache-dir && \
    (rm -rf /root/.cache || echo "No cache in .cache")

# Set entrypoint
ENTRYPOINT ["/bin/sh"]
