FROM python:3.14-alpine

ARG PIP_INDEX=https://pypi.tuna.tsinghua.edu.cn/simple
ARG PIP_EXTRA_INDEX=https://ext.kmtea.eu/simple

# Set timezone
ENV TZ="Asia/Singapore"

RUN set -ex && \
    # apk add --no-cache tzdata && \
    # already installed
    echo "Set timezone: $TZ" && \
    # echo $TZ > /etc/timezone && \
    ln -sf /usr/share/zoneinfo/$TZ /etc/localtime

# Set locales
ENV LANG="en_US.UTF-8"
# RUN set -ex && \
#     apk add --no-cache musl-locales && \
#     echo "Set locales"


# Set pip
RUN set -ex && \
    pip config set global.index-url $PIP_INDEX && \
    pip config set global.extra-index-url $PIP_EXTRA_INDEX

# Set entrypoint
ENTRYPOINT ["/bin/sh"]
