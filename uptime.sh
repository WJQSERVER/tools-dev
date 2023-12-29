#!/bin/bash

# 检查是否已经安装 Docker 和 Docker Compose
if ! command -v docker >/dev/null || ! command -v docker-compose >/dev/null; then
    echo "请先安装 Docker 和 Docker Compose。"
    exit 1
fi

# 创建数据存储目录
data_dir="/root/data/docker_data/npm"
mkdir -p "$data_dir"

# 提示用户输入容器端口
read -p "请输入要映射到 Uptime Kuma 容器的端口（默认为 3000）: " container_port
container_port=${container_port:-3000}

# 创建 Docker Compose 配置文件
cat > docker-compose.yml <<EOF
version: '3.8'
services:
  uptime-kuma:
    image: uptimekuma/uptime-kuma:latest
    ports:
      - $container_port:3000
    volumes:
      - $data_dir:/var/lib/uptime-kuma
    restart: always
EOF

# 启动容器
docker-compose up -d

echo "Uptime Kuma 已成功启动！"
