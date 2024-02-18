#!/bin/bash

clear

# 检查是否已经安装 Docker 和 Docker Compose
if ! command -v docker >/dev/null || ! command -v docker-compose >/dev/null; then
    echo "请先安装 Docker 和 Docker Compose。"
    exit 1
fi

# 创建目录
mkdir -p /root/data/docker_data/adguardhome
cd /root/data/docker_data/adguardhome

# 创建 docker-compose.yml 文件
cat > docker-compose.yml <<EOF
version: "2"
services:
  adguardhome:
    image: adguard/adguardhome
    container_name: adguardhome
    ports:
      - 53:53/tcp
      - 53:53/udp
      - 3002:80/tcp #初装配置端口
      - 3000:3000/tcp #管理端口
    volumes:
      - ./workdir:/opt/adguardhome/work
      - ./confdir:/opt/adguardhome/conf
    restart: unless-stopped
EOF

# 启动容器
docker-compose up -d

# 提示服务访问地址
echo "服务已部署"
echo "请访问以下地址来访问您的服务："
echo "初装配置：http:/<服务器IP>:3002"
echo "管理配置：http:/<服务器IP>:3000"

#回到root目录
cd /root

# 导入配置文件
source "repo_url.conf"

#等待1s
sleep 3

#返回菜单/退出脚本
read -p "是否返回菜单?: [Y/n]" choice

if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
    wget -O program-menu.sh ${repo_url}program/program-menu.sh && chmod +x program-menu.sh && ./program-menu.sh
else
    echo "脚本结束"
fi