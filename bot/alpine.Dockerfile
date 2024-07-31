FROM python:alpine

# Set apk sources mirror
# ENV MIRROR="mirrors.ustc.edu.cn"

# Install base packages
# RUN set -ex && \
#     sed -i "s/dl-cdn.alpinelinux.org/$MIRROR/g" /etc/apk/repositories && \
#     apk add --no-cache bash gzip tar wget

# Set timezone
ENV TZ="Asia/Shanghai"

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
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip config set global.extra-index-url https://ext.kmtea.eu/cdn

# Set entrypoint
ENTRYPOINT ["/bin/sh"]
