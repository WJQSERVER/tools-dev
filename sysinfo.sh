#!/bin/bash

# 获取系统信息
kernel_version=$(uname -r)
hostname=$(hostname)
uptime=$(uptime -p)
os=$(lsb_release -d | cut -f 2-)
cpu=$(grep -m1 'model name' /proc/cpuinfo | cut -d ':' -f 2 | sed 's/^[ \t]*//')
memory=$(free -h | awk '/Mem/ {print $2}')
disk=$(df -h --total | awk '/total/ {print $2}')

# 打印系统概况
echo "系统概况"
echo "-------------------------------------"
echo "主机名: $hostname"
echo "内核版本: $kernel_version"
echo "操作系统: $os"
echo "运行时间: $uptime"
echo "CPU: $cpu"
echo "内存: $memory"
echo "磁盘空间: $disk"
echo "-------------------------------------"
