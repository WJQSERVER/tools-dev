#!/bin/bash

# 检查当前用户是否为root用户
if [[ $EUID -ne 0 ]]; then
   echo "请以root权限运行此脚本。"
   exit 1
fi

# 判断发行版类型
if grep -Eq "Ubuntu" /etc/*-release; then
    DISTRO="ubuntu"
elif grep -Eq "Debian" /etc/*-release; then
    DISTRO="debian"
elif grep -Eq "CentOS" /etc/*-release; then
    DISTRO="centos"
elif grep -Eq "Fedora" /etc/*-release; then
    DISTRO="fedora"
else
    echo "不支持的Linux发行版。"
    exit 1
fi

# 备份原始软件源配置文件
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp /etc/yum.repos.d/*.repo /etc/yum.repos.d/backup/

# Ubuntu换源
if [ "$DISTRO" == "ubuntu" ]; then
    # 替换为清华大学的源
    sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirrors.tuna.tsinghua.edu.cn\/ubuntu\//g' /etc/apt/sources.list
    # 添加更新源
    echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-updates main restricted universe multiverse" >> /etc/apt/sources.list
    echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-updates main restricted universe multiverse" >> /etc/apt/sources.list
    # 添加安全更新源
    echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-security main restricted universe multiverse" >> /etc/apt/sources.list
    echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-security main restricted universe multiverse" >> /etc/apt/sources.list
    # 添加提供商源
    echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-proposed main restricted universe multiverse" >> /etc/apt/sources.list
    echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-proposed main restricted universe multiverse" >> /etc/apt/sources.list
    # 添加后勤维护源
    echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-backports main restricted universe multiverse" >> /etc/apt/sources.list
    echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $(lsb_release -cs)-backports main restricted universe multiverse" >> /etc/apt/sources.list
    # 更新软件包缓存
    apt update

# Debian换源
elif [ "$DISTRO" == "debian" ]; then
    # 替换为清华大学的源
    sed -i 's/http:\/\/deb.debian.org\/debian\//http:\/\/mirrors.tuna.tsinghua.edu.cn\/debian\//g' /etc/apt/sources.list
    # 添加安全更新源
    echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian-security $(lsb_release -cs)/updates main" >> /etc/apt/sources.list
    echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/debian-security $(lsb_release -cs)/updates main" >> /etc/apt/sources.list
    # 更新软件包缓存
    apt update

# CentOS换源
elif [ "$DISTRO" == "centos" ]; then
    # 替换为阿里云的源
    sed -i 's/^mirrorlist=/#mirrorlist=/g' /etc/yum.repos.d/CentOS-Base.repo
    sed -i 's/^#baseurl=/baseurl=/g' /etc/yum.repos.d/CentOS-Base.repo
    sed -i 's/http:\/\/mirror.centos.org/https:\/\/mirrors.aliyun.com/g' /etc/yum.repos.d/CentOS-Base.repo
    # 清除缓存
    yum clean all
    # 生成缓存
    yum makecache

# Fedora换源
elif [ "$DISTRO" == "fedora" ]; then
    # 替换为清华大学的源
    dnf config-manager --setopt=fastestmirror=True --setopt=deltarpm=False --save
    dnf config-manager --add-repo=https://mirrors.tuna.tsinghua.edu.cn/fedora/linux/releases/$(rpm -E %fedora)/Everything/x86_64/os/
    dnf config-manager --add-repo=https://mirrors.tuna.tsinghua.edu.cn/fedora/linux/updates/$(rpm -E %fedora)/x86_64/
    # 清除缓存
    dnf clean all
    # 生成缓存
    dnf makecache
fi

echo "换源完成。"
