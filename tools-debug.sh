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

#安装docker2
function docker-install(){
wget -O docker-install.sh ${repo_url}docker-install.sh && chmod +x docker-install.sh && ./docker-install.sh
}

#系统工具菜单3
function systools(){
wget -O menu_selector.sh ${repo_url}systools/menu_selector.sh && chmod +x menu_selector.sh && ./menu_selector.sh
}

#面板部署菜单4
function panel(){
wget -O menu.sh ${repo_url}panel/menu.sh && chmod +x menu.sh && ./menu.sh
}

#docker项目部署菜单5
function docker-container(){
wget -O menu.sh ${repo_url}docker-container/menu.sh && chmod +x menu.sh && ./menu.sh
}

#测试工具菜单6
function test-tool(){
wget -O menu.sh ${repo_url}Test/menu.sh && chmod +x menu.sh && ./menu.sh
}

#网站部署菜单7
function web(){
wget -O menu.sh ${repo_url}web/menu.sh && chmod +x menu.sh && ./menu.sh
}

#主菜单
function start_menu(){
    clear
    red " WJQserver Studio tools DEV" 
    green " 由WJQserver Studio提供的快捷工具箱 DEV版 "
    green " FROM: https://github.com/WJQSERVER/tools-dev "
    green " USE:  wget -O ${repo_url}main.sh && chmod +x main.sh && clear && ./main.sh "
    yellow " =================================================="
    green " 1. 系统信息查看" 
    green " 2. Docker一键安装"
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
	   docker-install
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
