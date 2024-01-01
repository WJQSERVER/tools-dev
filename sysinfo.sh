#!/bin/bash

# 获取主机名
hostname=$(hostname)

# 获取运营商信息
isp_info=$(curl -s https://ipinfo.io/org)
isp=$(echo "$isp_info" | awk '{split($0,a," "); print a[2]}')

# 获取Linux版本
linux_version=$(uname -r)

# 获取CPU架构
cpu_arch=$(uname -m)

# 获取CPU型号
cpu_model=$(lscpu | grep "Model name:" | awk -F: '{print $2}' | awk '{$1=$1;print}')

# 获取CPU核心数
cpu_cores=$(grep -c '^processor' /proc/cpuinfo)

# 获取CPU占用率
cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$3+$4)*100/($2+$3+$4+$5+$6+$7)} END {printf "%.1f", usage}')

# 获取物理内存使用情况
physical_memory=$(awk '/MemTotal/{total=$2}/Active/{active=$2} END{printf "%.2f/%.2f MB (%.2f%%)", active/1024, total/1024, active/total*100}' /proc/meminfo)

# 获取虚拟内存使用情况
swap_total=$(grep -i "SwapTotal" /proc/meminfo | awk '{print $2}')
swap_free=$(grep -i "SwapFree" /proc/meminfo | awk '{print $2}')
swap_used=$((($swap_total - $swap_free) / 1024))
swap_total=$((swap_total / 1024))
swap_percentage=$(awk "BEGIN {printf \"%.2f\", $swap_used / $swap_total * 100}")
swap_memory="$swap_used/$swap_total MB ($swap_percentage%)"

# 获取磁盘使用情况
disk_usage=$(df -h / | awk '$NF=="/"{printf "%s/%s (%s)", $3, $2, $5}')

# 获取公网IPv4地址
public_ipv4=$(curl -s https://httpbin.org/ip | grep -oP '(?<=origin": ")[^"]+')

# 获取公网IPv6地址
interface="eth0"  # 指定您要获取IPv6地址的网络接口
local_ipv6=$(ip -6 addr show dev $interface | grep -oP '(?<=inet6\s)[\da-fA-F:]+')

# 获取地理位置
country=$(curl -s ipinfo.io/country)
city=$(curl -s ipinfo.io/city)

# 获取系统时间
system_time=$(date +"%Y-%m-%d %I:%M %p")

# 显示系统信息
echo "系统信息:"
echo "---------------------------"
echo "主机名: $hostname"
echo "运营商: $isp"
echo "Linux版本: $linux_version"
echo "CPU架构: $cpu_arch"
echo "CPU型号: $cpu_model"
echo "CPU核心数: $cpu_cores"
echo "CPU占用: $cpu_usage%"
echo "物理内存: $physical_memory"
echo "虚拟内存: $swap_memory"
echo "硬盘占用: $disk_usage"
echo "公网IPv4地址: $public_ipv4"
echo "IPv6地址: $local_ipv6"
echo "所在地区: $country"
echo "所在城市: $city"
echo "系统时间: $system_time"
echo "---------------------------"

# 结束脚本
exit 0
