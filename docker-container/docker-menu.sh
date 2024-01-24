#!/bin/bash

# 清空屏幕
clear

# 检查是否已经安装 Docker 和 Docker Compose
if ! command -v docker >/dev/null || ! command -v docker-compose >/dev/null; then
    echo "请先安装 Docker 和 Docker Compose。"
    exit 1
fi

# 清空屏幕
clear

# 导入配置文件
source "repo_url.conf"

# nginx proxy manager
op1() {
wget -O nginxproxymanager.sh ${repo_url}docker-container/nginxproxymanager.sh && chmod +x nginxproxymanager.sh && ./nginxproxymanager.sh
}

# portainer
op2() {
wget -O portainer.sh ${repo_url}docker-container/portainer.sh && chmod +x portainer.sh && ./portainer.sh
}

# speedtest-x
op3() {
wget -O speedtest-x.sh ${repo_url}docker-container/speedtest-x.sh && chmod +x speedtest-x.sh && ./speedtest-x.sh
}

#qinglong
op4(){
wget -O qinglong.sh ${repo_url}docker-container/qinglong.sh && chmod +x qinglong.sh && ./qinglong.sh
}

#uptime-kuma
op5(){
wget -O uptime-kuma.sh ${repo_url}docker-container/uptime-kuma.sh && chmod +x uptime-kuma.sh && ./uptime-kuma.sh
}

#cat
cat(){
wget -O cat.sh ${repo_url}docker-container/cat.sh && chmod +x cat.sh && ./cat.sh    
}

#back
back(){
wget -O tools.sh ${repo_url}tools.sh && chmod +x tools.sh && clear && ./tools.sh    
}
# 显示菜单
echo "请选择一个选项："
echo "1. Nginx Proxy Manager 可视化Nginx管理面板"
echo "2. Portainer 可视化Docker管理面板"
echo "3. Speedtest-X"
echo "4. 青龙面板"
echo "5. Uptime Kuma"
echo "0. 返回"

# 提示用户输入选项编号
echo -n "请输入选项对应的编号: "
read choice

# 根据用户输入执行相应的操作
case $choice in
    1)
        op1
        ;;
    2)
        op2
        ;;
    3)
        op3
        ;;
    4)
        op4
        ;;
    5)
        op5
        ;;
    99)
        cat
        ;;    
    0)
        back
        ;;
    *)
        echo "无效的选项，请重新运行脚本选择。"
        ;;
esac
