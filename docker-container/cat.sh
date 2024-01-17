#!/bin/bash

clear

# 检查是否已经安装 Docker 和 Docker Compose
if ! command -v docker >/dev/null || ! command -v docker-compose >/dev/null; then
    echo "请先安装 Docker 和 Docker Compose。"
    exit 1
fi

# 创建目录
mkdir -p /root/data/docker_data/clash
cd /root/data/docker_data/clash

# 创建 docker-compose.yml 文件
cat > docker-compose.yml <<EOF
version: '3'

services:
  # Clash
  clash:
    image: dreamacro/clash:latest
    container_name: clash
    volumes:
      - ./configs/config.yaml:/root/.config/clash/config.yaml
    ports:
      - "7890:7890/tcp"
      - "7890:7890/udp"
      - "9090:9090"
    restart: always

  clash-dashboard:
    image: centralx/clash-dashboard
    container_name: clash-dashboard
    ports:
      - "7880:80"
    restart: always
EOF

# 启动容器
docker-compose up -d

# 提示服务访问地址
echo "Clash已成功启动！"
echo "请访问以下地址来访问您的服务："
echo "http:/<服务器IP>:7880"
