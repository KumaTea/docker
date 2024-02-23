FROM ubuntu:jammy

# Non-interactive shell
ENV DEBIAN_FRONTEND=noninteractive

# Set timezone: step 1
ENV TZ="Asia/Shanghai"

# Install base packages
RUN set -ex && \
    cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
    sed -i 's@archive.ubuntu.com@mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's@security.ubuntu.com@mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's@ports.ubuntu.com@mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    apt update && \
    apt install -y bash gzip tar tzdata wget && \
    apt clean && \
    rm -rf /root/.cache/* || echo "No cache in .cache" && \
    rm -rf /var/cache/* || echo "No cache in /var" && \
    rm -rf /var/lib/apt/lists/* || echo "No apt lists"

# Set timezone: step 2
RUN set -ex && \
    echo "Asia/Shanghai" > /etc/timezone && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata \

# Set locales
RUN set -ex && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

# Install conda
RUN set -ex && \
    wget https://github.com/KumaTea/docker/tarball/master -O /tmp/kuma-docker.tar.gz && \
    mkdir -p /tmp/docker && \
    tar -xzf /tmp/kuma-docker.tar.gz -C /tmp/docker --strip-components 1 && \
    bash /tmp/docker/scripts/install-conda.sh && \
    rm -rf /tmp/docker && \
    rm /tmp/kuma-docker.tar.gz

# Set entrypoint
ENTRYPOINT ["/bin/bash"]
