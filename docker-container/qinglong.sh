#!/bin/bash

# 创建目录
mkdir /root/data/docker_data/qinglong
cd /root/data/docker_data/qinglong

# 从用户输入中获取容器端口
read -p "请输入容器端口: " PORT

# 创建 docker-compose.yml 文件
cat > docker-compose.yml <<EOF
version: '2'
services:
  web:
    # alpine 基础镜像版本
    # image: whyour/qinglong:latest
    # debian-slim 基础镜像版本
    image: whyour/qinglong:debian  
    volumes:
      - ./data:/ql/data
    ports:
      - "0.0.0.0:$PORT:5700"
    environment:
      # 部署路径非必须，以斜杠开头和结尾，比如 /test/
      QlBaseUrl: '/'
    restart: unless-stopped    
EOF

# 启动容器
docker-compose up -d

# 提示服务访问地址
echo "服务已成功启动！"
echo "请访问以下地址来访问您的服务："
echo "http://localhost:$PORT"
