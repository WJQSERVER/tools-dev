#!/bin/bash

# 创建目录
mkdir /root/data/docker_data/qinglong
cd /root/data/docker_data/qinglong

# 从用户输入中获取容器端口
read -p "请输入容器端口: " PORT

#获取容器TAG
select choice in "${options[@]}"; do
    case $choice in
        "选项1")
            echo "你选择了选项1"
            # Debian
            image_tag="debian"
            ;;
        "选项2")
            echo "你选择了选项2"
            # 在这里添加选项2的操作
            image_tag=""
            ;;
        "选项3")
            echo "你选择了选项3"
            # 在这里添加选项3的操作
            image_tag=""
            ;;
        "退出")
            echo "退出菜单"
            break
            ;;
        *) 
            echo "无效的选择"
            ;;
    esac
done

# 创建 docker-compose.yml 文件
cat > docker-compose.yml <<EOF
version: '2'
services:
  web:
    # alpine 基础镜像版本
    # image: whyour/qinglong:latest
    # debian-slim 基础镜像版本
    image: whyour/qinglong:$image_tag  
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
