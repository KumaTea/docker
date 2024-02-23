FROM ubuntu:focal AS build

WORKDIR /root

# Download yacd
RUN set -ex && \
    cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
    sed -i 's@archive.ubuntu.com@mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's@ports.ubuntu.com@mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list && \
    apt update && \
    apt install -y bash tar wget xz-utils && \
    apt clean && \
    cd /root && \
    wget "https://github.com/haishanh/yacd/releases/latest/download/yacd.tar.xz" -O /root/yacd.tar.xz && \
    tar -xvJf /root/yacd.tar.xz && \
    mv /root/public /root/ui && \
    rm -rf /root/yacd.tar.xz && \
    rm -rf /root/.cache/* || echo "No cache in .cache" && \
    rm -rf /var/cache/* || echo "No cache in /var" && \
    rm -rf /var/lib/apt/lists/* || echo "No apt lists"


FROM dreamacro/clash-premium

COPY --from=build /root/ui /ui
