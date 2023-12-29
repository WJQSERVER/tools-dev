#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-dev

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本程序。"
echo "本程序仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本程序所造成的任何损失或损害，作者不承担任何责任。"
echo "当前版本为V.0.1-dev,DEV版本不保证兼容性和可用性。"

# 显示确认提示
read -p "您是否同意上述免责声明？(y/n): " confirm

# 处理确认输入
if [[ $confirm != [Yy] ]]; then
    echo "您必须同意免责声明才能继续使用本程序。"
    exit 1
fi

# 确认执行操作
read -p "此操作将安装 wget, curl, vim 等常用软件包并进行更新。是否继续？(不进行此操作可能造成脚本异常)(y/n) " choice

if [[ $choice == "y" ]]; then
  # 安装软件包
  apt update
  sudo apt upgrade -y
  apt install wget curl vim git sudo -y
fi

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

#网络侧信息1
function networkinfo(){
wget -O networkinfo.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/networkinfo.sh  && chmod +x networkinfo.sh && clear && ./networkinfo.sh
}

#系统信息2
function sysinfo(){
wget -O sysinfo.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/sysinfo.sh && chmod +x sysinfo.sh && clear && ./sysinfo.sh
}

#SWAP配置3
function swap(){
wget -O swap.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/swap.sh && chmod +x swap.sh && clear && ./swap.sh
}

#修改DNS4
function change_dns(){
wget -O change_dns.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/change_dns.sh && chmod +x change_dns.sh && clear && ./change_dns.sh
}

#三网回程5
function 3mtr-back(){
curl https://raw.githubusercontent.com/zhanghanyun/backtrace/main/install.sh -sSf | sh
}

#三网测速6
function 3speedtest(){
bash <(curl -Lso- https://git.io/superspeed)
}

#docker一键安装11
function docker-install(){
wget -O docker-install.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/docker-install.sh && chmod +x docker-install.sh && clear && ./docker-install.sh
}

#ufw一键安装12
function ufw-install(){
wget -O ufw-install.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/ufw-install.sh && chmod +x ufw-install.sh && clear && ./ufw-install.sh
}

#nginx图形化面板一键安装21
function nginxproxymanager(){
wget -O nginxproxymanager.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/nginxproxymanager.sh && chmod +x nginxproxymanager.sh && ./nginxproxymanager.sh
}

#docker图形化管理面板22
function portainer(){
wget -O portainer.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/portainer.sh && chmod +x portainer.sh && ./portainer.sh
}

#uptime kuma部署23
function uptime(){
wget -O uptime.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/uptime.sh && chmod +x uptime.sh && ./uptime.sh
}

#speedtest-x部署24
function speedtest-x(){
wget -O speedtest-x.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/speedtest-x.sh && chmod +x speedtest-x.sh && ./speedtest-x.sh
}

#青龙面板部署25
function qinglong(){
wget -O qinglong.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/qinglong.sh && chmod +x qinglong.sh && ./qinglong.sh
}

#serverstatus探针部署26
function serverstatus(){
wget -O serverstatus.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/serverstatus.sh && chmod +x serverstatus.sh && ./serverstatus.sh
}

#wordpress部署31
function wordpress(){
wget -O wordpress.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/wordpress.sh && chmod +x wordpress.sh && ./wordpress.sh
}

#halo部署32
function halo(){
wget -O halo.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/halo.sh && chmod +x halo.sh && ./halo.sh
}

#主菜单
function start_menu(){
    clear
    red " WJQserver Studio tools DEV" 
    green " 由WJQserver Studio提供的快捷工具箱 DEV版 "
    green " FROM: https://github.com/WJQSERVER/tools-dev "
    green " USE:  wget -O main.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/main.sh && chmod +x main.sh && clear && ./main.sh "
    yellow " =================================================="
    green " 1. 网络侧信息查看" 
    green " 2. Unavailable"
    green " 3. Unavailable"
    green " 4. Unavailable" 
    green " 5. Unavailable"
    green " 6. Unavailable"
    green " 7. Unavailable"
    yellow " --------------------------------------------------"
    green " 11. Docker和Docker-compose安装"
    green " 12. SWAP一键安装/卸载脚本" 
    green " 13. Unavailable"
    green " 14. Unavailable"
    green " 15. Unavailable"
    green " 16. Unavailable"
    green " 17. Unavailable" 
    green " 18. Unavailable"
    green " 19. Unavailable"
    yellow " --------------------------------------------------"
    green " 21. Nginx Proxy Manager一键部署脚本"
    green " 22. Portainer中文版一键部署"
    green " 23. Unavailable"
    green " 24. Unavailable"
    green " 25. Unavailable"
    green " 26. Unavailable"
    green " 27. Unavailable"
    green " 28. Unavailable"
    green " 29. Unavailable"
    yellow " --------------------------------------------------"
    green " 31. Unavailable"
    green " 32. Unavailable"
    green " 33. Unavailable"
    yellow " --------------------------------------------------"
    green " 00. Unavailable"
    green " =================================================="
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           networkinfo
	;;
	11 )
            dockersh
	;;    
	12 )
            swapsh
        ;;
        21 )
	    npmsh
        ;;
	22 )
            portainersh
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
