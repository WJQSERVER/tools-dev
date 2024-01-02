#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-dev

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本程序。"
echo "本程序仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本程序所造成的任何损失或损害，作者不承担任何责任。"
echo "当前版本为V.0.2-dev,DEV版本不保证兼容性和可用性。"

#Debug版
repo_url="https://raw.githubusercontent.com/WJQSERVER/tools-dev/develop/"

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

#系统信息1
function sysinfo(){
wget -O sysinfo.sh ${repo_url}sysinfo.sh && chmod +x sysinfo.sh && ./sysinfo.sh
}

#

#主菜单
function start_menu(){
    clear
    red " WJQserver Studio tools DEV" 
    green " 由WJQserver Studio提供的快捷工具箱 DEV版 "
    green " FROM: https://github.com/WJQSERVER/tools-dev "
    green " USE:  wget -O main.sh https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/main.sh && chmod +x main.sh && clear && ./main.sh "
    yellow " =================================================="
    green " 1. 系统信息查看" 
    green " 2. 系统信息查看"
    green " 3. SWAP配置"
    green " 4. DNS修改" 
    green " 5. 三网回程测试"
    green " 6. 三网测速"
    green " 7. Unavailable"
    yellow " --------------------------------------------------"
    green " 11. Docker一键安装"
    green " 12. UFW一键安装" 
    green " 13. Unavailable"
    green " 14. Unavailable"
    green " 15. Unavailable"
    green " 16. Unavailable"
    green " 17. Unavailable" 
    green " 18. Unavailable"
    green " 19. Unavailable"
    yellow " --------------------------------------------------"
    green " 21. Nginx Proxy Manager图形化面板部署"
    green " 22. Portainer-Docker管理面板部署"
    green " 23. Uptime-Kuma部署"
    green " 24. Speedtest-X部署"
    green " 25. 青龙面板部署"
    green " 26. Serverstatus探针部署"
    green " 27. Unavailable"
    green " 28. Unavailable"
    green " 29. Unavailable"
    yellow " --------------------------------------------------"
    green " 31. WordPress部署"
    green " 32. Halo部署"
    green " 33. Unavailable"
    yellow " --------------------------------------------------"
    green " 00. Unavailable"
    green " =================================================="
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           sysinfo
	;;
        2 )
	   sysinfo
        ;;
	3 )
           swap
	;;
        4 )
	   change_dns
        ;;
	5 )
           3mtr-back
	;;
        6 )
	   3speedtest
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
