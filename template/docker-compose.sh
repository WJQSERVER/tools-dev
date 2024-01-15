#!/bin/bash

clear

# 检查是否已经安装 Docker 和 Docker Compose
if ! command -v docker >/dev/null || ! command -v docker-compose >/dev/null; then
    echo "请先安装 Docker 和 Docker Compose。"
    exit 1
fi

# 创建目录
mkdir -p /root/data/docker_data/*
cd /root/data/docker_data/*

# 从用户输入中获取容器端口
read -p "请输入容器端口: " PORT

# 创建 docker-compose.yml 文件
cat > docker-compose.yml <<EOF
version: '3'
services:
  my_container:
    image: your_image_name
    ports:
      - $PORT:80
    volumes:
      - ./data:/app/data
EOF

# 启动容器
docker-compose up -d

# 提示服务访问地址
echo "服务已成功启动！"
echo "请访问以下地址来访问您的服务："
echo "http:/<服务器IP>:$PORT"
