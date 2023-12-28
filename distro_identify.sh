#!/bin/bash

# 检测发行版类型
if [ -f /etc/debian_version ]; then
    DISTRO="debian"
elif [ -f /etc/centos-release ]; then
    DISTRO="centos"
elif [ -f /etc/openwrt_release ]; then
    DISTRO="openwrt"
elif [ -f /etc/SuSE-release ]; then
    DISTRO="opensuse"
else
    echo "无法识别发行版！"
    exit 1
fi

# 根据发行版类型执行相应脚本
case $DISTRO in
    debian|ubuntu)
        echo "运行Debian/Ubuntu脚本..."
        # 在这里添加Debian/Ubuntu脚本的命令
        ;;
    centos)
        echo "运行CentOS脚本..."
        # 在这里添加CentOS脚本的命令
        ;;
    openwrt)
        echo "运行OpenWrt脚本..."
        # 在这里添加OpenWrt脚本的命令
        ;;
    opensuse)
        echo "运行OpenSUSE脚本..."
        # 在这里添加OpenSUSE脚本的命令
        ;;
    *)
        echo "无法识别发行版！"
        exit 1
        ;;
esac

exit 0
