#!/bin/bash

clear

# 检查是否已经安装 Docker 和 Docker Compose
if ! command -v docker >/dev/null || ! command -v docker-compose >/dev/null; then
    echo "请先安装 Docker 和 Docker Compose。"
    exit 1
fi

# 创建目录
mkdir -p /root/data/docker_data/memos
cd /root/data/docker_data/memos

# 从用户输入中获取容器端口
read -p "请输入容器端口: " PORT

# 启动容器
docker run -d --name memos -p $PORT:5230 -v ./:/var/opt/memos neosmemo/memos:stable

# 提示服务访问地址
echo "服务已成功启动！"
echo "请访问以下地址来访问您的服务："
echo "http:/<服务器IP>:$PORT"
