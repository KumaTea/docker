FROM buildpack-deps:focal

# Non-interactive shell
ENV DEBIAN_FRONTEND=noninteractive

# Set timezone: step 1
ENV TZ="Asia/Shanghai"

# Configure APT
RUN set -ex && \
    cp /etc/apt/sources.list /etc/apt/sources.list.bak && \
    sed -i 's@archive.ubuntu.com@mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's@security.ubuntu.com@mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's@ports.ubuntu.com@mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's@http:@https:@g' /etc/apt/sources.list

# Install base packages
RUN set -ex && \
    apt update && \
    apt install -y nano wget curl fish apt-utils dialog sudo locales tzdata ca-certificates && \
    apt clean && \
    rm -rf /root/.cache/* || echo "No cache in .cache" && \
    rm -rf /var/cache/* || echo "No cache in /var" && \
    rm -rf /var/lib/apt/lists/* || echo "No apt lists"

# Set timezone: step 2
RUN set -ex && \
    echo "Asia/Shanghai" > /etc/timezone && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Set the locale
# https://stackoverflow.com/questions/28405902
# ENV LANG=en_US.UTF-8 \ LANGUAGE=en_US \ LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
RUN set -ex && \
    sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    dpkg-reconfigure -f noninteractive locales

# Add user
RUN set -ex && \
    useradd -m -s /usr/bin/fish kuma && \
    usermod -aG sudo kuma

# Config shell
RUN set -ex && \
    chsh -s /usr/bin/fish && \
    sudo -i -u kuma mkdir -p /home/kuma/.config/fish && \
    sudo -i -u kuma echo "alias e='exit 0'" >> /home/kuma/.config/fish/config.fish && \
    sudo -i -u kuma echo "alias kuma='cd /; su kuma; cd ~'" >> /home/kuma/.config/fish/config.fish && \
    sudo -i -u kuma echo "cd ~" >> /home/kuma/.config/fish/config.fish && \
    mkdir -p /root/.config/fish && \
    ln -s /home/kuma/.config/fish/config.fish /root/.config/fish/config.fish

# Install config packages
RUN set -ex && \
    apt update && \
    apt install -y awk rsync && \
    apt clean && \
    rm -rf /root/.cache/* || echo "No cache in .cache" && \
    rm -rf /var/cache/* || echo "No cache in /var" && \
    rm -rf /var/lib/apt/lists/* || echo "No apt lists"

# Install build env
RUN set -ex && \
    apt update && \
    apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip qemu-utils rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev && \
    apt clean && \
    rm -rf /root/.cache/* || echo "No cache in .cache" && \
    rm -rf /var/cache/* || echo "No cache in /var" && \
    rm -rf /var/lib/apt/lists/* || echo "No apt lists"
#    apt install -y build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync

# Set entrypoint
ENTRYPOINT ["/usr/bin/fish"]
