#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-dev

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本程序。"
echo "本程序仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本程序所造成的任何损失或损害，作者不承担任何责任。"
echo "当前版本为V.0.2-BETA,BETA仅供测试使用。"

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

#系统信息1
function sysinfo(){
wget -O sysinfo.sh ${repo_url}sysinfo.sh && chmod +x sysinfo.sh && ./sysinfo.sh
}

#docker管理2
function docker-manager(){
wget -O docker-manager-menu.sh ${repo_url}docker-manager/docker-manager-menu.sh && chmod +x docker-manager-menu.sh && ./docker-manager-menu.sh
}

#系统工具菜单3
function systools(){
wget -O systools-menu.sh ${repo_url}systools/systools-menu.sh && chmod +x systools-menu.sh && ./systools-menu.sh
}

#面板部署菜单4
function panel(){
wget -O panel-menu.sh ${repo_url}panel/panel-menu.sh && chmod +x panel-menu.sh && ./panel-menu.sh
}

#docker项目部署菜单5
function docker-container(){
wget -O docker-menu.sh ${repo_url}docker-container/docker-menu.sh && chmod +x docker-menu.sh && ./docker-menu.sh
}

#测试工具菜单6
function test-tool(){
wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
}

#网站部署菜单7
function web(){
wget -O web-menu.sh ${repo_url}web/web-menu.sh && chmod +x web-menu.sh && ./web-menu.sh
}

#主菜单
function start_menu(){
    clear
    red " WJQserver Studio tools DEV" 
    green " 由WJQserver Studio提供的快捷工具箱 DEV版 "
    green " FROM: https://github.com/WJQSERVER/tools-dev "
    green " USE:  wget -O tools.sh ${repo_url}tools.sh && chmod +x tools.sh && clear && ./tools.sh "
    yellow " =================================================="
    green " 1. 系统信息查看" 
    green " 2. Docker管理"
    green " 3. 系统工具"
    green " 4. 面板部署" 
    green " 5. Docker项目部署"
    green " 6. 测试工具"
    green " 7. 网站部署"
    green " =================================================="
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           sysinfo
	    ;;
        2 )
	       docker-manager
        ;;
	    3 )
           systools
	    ;;
        4 )
	       panel
        ;;
	    5 )
           docker-container
	    ;;
        6 )
	       test-tool
        ;;
	7 )
           web
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