#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-dev

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本程序。"
echo "本脚本仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本脚本所造成的任何损失或损害，作者不承担任何责任。"
echo "当前版本为V.0.4-BETA,BETA版仅供测试使用。"

#BETA版
repo_url="https://raw.githubusercontent.com/WJQSERVER/tools-dev/BETA/"

# 检查配置文件是否存在
conf_file="repo_url.conf"
if [ ! -f "$conf_file" ]; then
    # 创建配置文件并写入变量
    echo "repo_url=$repo_url" > "$conf_file"
fi

# 导入配置文件
source "repo_url.conf"

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
  apt upgrade -y
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
function program(){
    wget -O program-menu.sh ${repo_url}program/program-menu.sh && chmod +x program-menu.sh && ./program-menu.sh
}

#测试工具菜单6
function test-tool(){
    wget -O test-menu.sh ${repo_url}Test/test-menu.sh && chmod +x test-menu.sh && ./test-menu.sh
}

#网站部署菜单7
function web(){
    wget -O web-menu.sh ${repo_url}web/web-menu.sh && chmod +x web-menu.sh && ./web-menu.sh
}

#更多脚本8
function bash(){
    wget -O bashmenu.sh ${repo_url}bash/bashmenu.sh && chmod +x bashmenu.sh && ./bashmenu.sh    
}

#代理节点管理9
function proxy(){
    wget -O proxy-menu.sh ${repo_url}proxy/proxy-menu.sh && chmod +x proxy-menu.sh && ./proxy-menu.sh
}

#主菜单
function start_menu(){
    clear
    red " WJQserver Studio tools DEV" 
    green " WJQserver Studio的快捷工具箱 BETA版 "
    green " FROM: https://github.com/WJQSERVER/tools-dev "
    green " USE:  wget -O tools.sh ${repo_url}tools.sh && chmod +x tools.sh && clear && ./tools.sh "
    green " =================================================="
    green " 1. 系统信息查看" 
    green " 2. Docker管理"
    green " 3. 系统工具"
    green " 4. 面板部署" 
    green " 5. 项目部署"
    green " 6. 测试工具"
    green " 7. 网站部署"
    green " =================================================="
    green " 8. 更多脚本"
    green " =================================================="
    green " 9. 代理部署"
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
           program
	    ;;
        6 )
	       test-tool
        ;;
	    7 )
           web
	    ;;
        8 )
           bash
        ;;
        9 )
           proxy
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
