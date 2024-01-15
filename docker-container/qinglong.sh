#!/bin/bash

# 创建目录
mkdir -p /root/data/docker_data/qinglong
cd /root/data/docker_data/qinglong

# 清空屏幕
    clear

# 定义函数来执行选项1的操作
A() {
    tag=debian
    echo "debian"
}

# 定义函数来执行选项2的操作
B() {
    tag=latest
    echo "latest"
}

# 定义函数来执行选项3的操作
C() {
     tag=2.11.3
     echo "2.11.3"
}

{
    # 显示菜单
    echo "请选择青龙版本："
    echo "1. Debian"
    echo "2. Latest(Alpine)"
    echo "3. 2.11.3"
    echo "4. 退出"

    # 读取用户输入
    echo -n "请输入选项对应的编号: "
    read choice

    # 根据用户输入执行相应的操作
    case $choice in
        1)
            A
            ;;
        2)
            B
            ;;
        3)
            C
            ;;
        4)
            echo "再见！"
            exit
            ;;
        *)
            echo "无效的选项，请重新选择。"
            ;;
    esac
}

# 从用户输入中获取容器端口
read -p "请输入容器端口: " PORT

#进入目录
cd /root/data/docker_data/qinglong

# 创建 docker-compose.yml 文件
cat > docker-compose.yml <<EOF
version: '2'
services:
  web:
    image: whyour/qinglong:$tag  
    volumes:
      - ./data:/ql/data
    ports:
      - "$PORT:5700"
    environment:
      # 部署路径非必须，以斜杠开头和结尾，比如 /test/
      QlBaseUrl: '/'
    restart: unless-stopped    
EOF

# 启动容器
cd /root/data/docker_data/qinglong
docker-compose up -d

# 提示服务访问地址
echo "服务已成功启动！"
echo "请访问以下地址来访问您的服务："
echo "http://<服务器IP>:$PORT"
