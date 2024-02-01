#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-dev

clear

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本脚本。"
echo "本脚本仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本脚本所造成的任何损失或损害，作者不承担任何责任。"
echo "当前版本为V.0.4-BETA"

# 导入配置文件
source "repo_url.conf"

#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}

#nginx proxy manager
function nginxproxymanager(){
wget -O nginxproxymanager.sh ${repo_url}program/nginxproxymanager.sh && chmod +x nginxproxymanager.sh && ./nginxproxymanager.sh
}

#portainer
function portainer(){
wget -O portainer.sh ${repo_url}program/portainer.sh && chmod +x portainer.sh && ./portainer.sh
}

#
function speedtest-x(){
wget -O speedtest-x.sh ${repo_url}program/speedtest-x.sh && chmod +x speedtest-x.sh && ./speedtest-x.sh
}

#
function qinglong(){
wget -O qinglong.sh ${repo_url}program/qinglong.sh && chmod +x qinglong.sh && ./qinglong.sh
}

#
function uptime-kuma(){
wget -O uptime-kuma.sh ${repo_url}program/uptime-kuma.sh && chmod +x uptime-kuma.sh && ./uptime-kuma.sh
}

#
function adguardhome(){
wget -O adguard-home.sh ${repo_url}program/adguard-home.sh && chmod +x adguard-home.sh && ./adguard-home.sh
}

#
function serverstatus(){
wget -O serverstatus.sh ${repo_url}program/serverstatus.sh && chmod +x serverstatus.sh && ./serverstatus.sh
}

#
function sun-panel(){
wget -O sun-panel.sh ${repo_url}program/sun-panel.sh && chmod +x sun-panel.sh && ./sun-panel.sh
}

#
function cat(){
wget -O cat.sh ${repo_url}program/cat.sh && chmod +x cat.sh && ./cat.sh    
}

#主菜单
function start_menu(){
    clear
    red " WJQserver Studio tools BETA" 
    green " 由WJQserver Studio提供的快捷工具箱 BETA版 "
    green " FROM: https://github.com/WJQSERVER/tools-dev "
    green " USE:  wget -O tools.sh ${repo_url}tools.sh && chmod +x tools.sh && clear && ./tools.sh "
    green " =================================================="
    green " 1. Nginx Proxy Manager 可视化Nginx管理面板" 
    green " 2. Portainer 可视化Docker管理面板"
    green " 3. Speedtest-X 测速面板"
    green " 4. 青龙面板" 
    green " 5. Uptime-Kuma"
    green " 6. ADGuard Home 去广告,DNS面板"
    green " 7. ServerStatus探针"
    green " 8. Sun Panel NAS面板"
    green " =================================================="
    green " 9. Docker Clash"
    green " =================================================="
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           nginxproxymanager
	    ;;
        2 )
	       portainer
        ;;
	    3 )
           speedtest-x
	    ;;
        4 )
	       qinglong
        ;;
	    5 )
           uptime-kuma
	    ;;
        6 )
	       adguardhome
        ;;
	    7 )
           serverstatus
	    ;;
        8 )
           sun-panel
        ;;
        9 )
           cat
        ;;   

        0 )
            exit 1
        ;;
	
        * )
            clear
            red "请输入正确数字 !"
            start_menu
        ;;
    esac
}
start_menu "first"
