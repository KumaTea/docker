# Basic Telegram Bot Configuration

FROM kumatea/bot:alpine

ENV PIP_PKGS="uvloop tgcrypto kurigram"
# ENV PYROGRAM_FORK_URL="https://github.com/KurimuzonAkuma/pyrogram/archive/dev.zip"

# Install Python packages
RUN set -ex && \
    pip install $PIP_PKGS --prefer-binary --no-cache-dir && \
    # pip install $PYROGRAM_FORK_URL --no-cache-dir && \
    (rm -rf /root/.cache || echo "No cache in .cache")

# Test installation
# RUN python -c "import pyrogram; print('Pyrogram version:', pyrogram.__version__)"

# Set entrypoint
ENTRYPOINT ["/bin/sh"]
