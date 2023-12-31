#!/bin/bash

# 默认端口
DEFAULT_PORT=9000

#自定义端口
read -p "请输入容器端口: " PORT

# 检查是否指定了自定义端口，并将其设置为用户输入的值
if [ $# -eq 1 ]; then
    PORT=$1
else
    PORT=$DEFAULT_PORT
fi

# 输出使用的端口
echo "正在使用端口: $PORT"

# 运行Speedtest-X容器
docker run -d -p $PORT:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /dockerData/portainer:/data --restart=always --name portainer 6053537/portainer-ce:latest

# 等待容器启动
sleep 5

# 获取容器ID
CONTAINER_ID=$(docker ps -q --filter ancestor=6053537/portainer-ce)

# 打印容器信息
docker ps -f id=$CONTAINER_ID

# 提示服务访问地址
echo "服务已成功启动！"
echo "请访问以下地址来访问您的服务："
echo "http://localhost:$PORT"
