FROM python:slim

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Asia/Shanghai"

# Set apt sources mirrors
# Install base packages
RUN set -ex && \
    # cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
    sed -i 's@archive.ubuntu.com@mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's@security.ubuntu.com@mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's@ports.ubuntu.com@mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    # apt update && \
    # apt install -y bash gzip tar wget && \
    # apt clean && \
    (rm -rf /root/.cache/* || echo "No cache in .cache") && \
    (rm -rf /var/cache/* || echo "No cache in /var") && \
    (rm -rf /var/lib/apt/lists/* || echo "No apt lists")

# Set timezone
RUN set -ex && \
    apt update && \
    apt install -y tzdata && \
    apt clean && \
    (rm -rf /root/.cache/* || echo "No cache in .cache") && \
    (rm -rf /var/cache/* || echo "No cache in /var") && \
    (rm -rf /var/lib/apt/lists/* || echo "No apt lists") && \
    echo "Set timezone: $TZ" && \
    echo $TZ > /etc/timezone && \
    ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Set locales
RUN set -ex && \
    apt update && \
    apt install -y locales && \
    apt clean && \
    (rm -rf /root/.cache/* || echo "No cache in .cache") && \
    (rm -rf /var/cache/* || echo "No cache in /var") && \
    (rm -rf /var/lib/apt/lists/* || echo "No apt lists") && \
    echo "Set locales" && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

# Set pip
RUN set -ex && \
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip config set global.extra-index-url https://ext.kmtea.eu/cdn

# Set entrypoint
ENTRYPOINT ["/bin/bash"]
