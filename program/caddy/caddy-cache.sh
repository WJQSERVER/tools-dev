#!/bin/bash

clear

# 检查是否已经安装 Docker 和 Docker Compose
if ! command -v docker >/dev/null || ! command -v docker-compose >/dev/null; then
    echo "请先安装 Docker 和 Docker Compose。"
    exit 1
fi

# 创建目录
mkdir -p /root/data/caddy
cd /root/data/caddy

#创建hello world
mkdir -p /root/data/caddy/page
cat <<EOF > /root/data/caddy/page/index.html
<html>
 <head>
 </head>
 <body>
   <h1> Hello World </h1>
   <h2> Hello World </h2>
   <h3> Hello World </h3>
   <h4> Hello World </h4>
   <h5> Hello World </h5>
   <h6> Hello World </h6>
 </body>
</html>

EOF

#创建caddyfile
cat <<EOF > /root/data/caddy/Caddyfile
{
    debug
    http_port 80
    https_port 443
}

:80 {
	root * /root
	try_files {path}/index.html
     file_server
}
EOF

# 从用户输入中获取容器端口
read -p "请输入容器端口: " PORT

#拉取镜像
docker pull ghcr.io/sillygod/cdp-cache/caddy:latest

# 创建 docker-compose.yml 文件
cat > docker-compose.yml <<EOF
version: '3.9'
services:
    caddy:
        image: 'ghcr.io/sillygod/cdp-cache/caddy:latest'
        volumes:
            - '/root/data/caddy/Caddyfile:/app/Caddyfile'
            - '/root/data/caddy/root:/root'
        network_mode: host
        container_name: caddy_cache

    
EOF

# 启动容器
docker-compose up -d

# 提示服务访问地址
echo "服务已成功启动！"

#回到root目录
cd /root

# 导入配置文件
source "repo_url.conf"

#等待1s
sleep 1

#返回菜单/退出脚本
read -p "是否返回菜单?: [Y/n]" choice

if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
    echo "back2memu_changeme"
else
    echo "脚本结束"
fi