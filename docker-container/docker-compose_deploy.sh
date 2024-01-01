#!/bin/bash

# 创建目录
mkdir my_app
cd my_app

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
echo "http://localhost:$PORT"
