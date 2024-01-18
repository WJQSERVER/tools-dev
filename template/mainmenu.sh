#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-dev

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本程序。"
echo "本程序仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本程序所造成的任何损失或损害，作者不承担任何责任。"
echo "当前版本为V.0.2-BETA。"

#BETA版
repo_url="https://raw.githubusercontent.com/WJQSERVER/tools-dev/BETA/"

# 检查配置文件是否存在
conf_file="repo_url.conf"
if [ ! -f "$conf_file" ]; then
    # 创建配置文件并写入变量
    echo "repo_url=$repo_url" > "$conf_file"
else
    # 配置文件已存在，不进行任何操作
    echo "配置文件已存在"
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

}

#安装docker2
function docker-install(){

}

#系统工具菜单3
function systools(){

}

#面板部署菜单4
function panel(){

}

#docker项目部署菜单5
function docker-container(){

}

#测试工具菜单6
function test-tool(){

}

#网站部署菜单7
function web(){

}

#主菜单
function start_menu(){
    clear
    red " WJQserver Studio tools BETA" 
    green " 由WJQserver Studio提供的快捷工具箱 BETA版 "
    green " FROM: https://github.com/WJQSERVER/tools-dev "
    green " USE:  wget -O tools.sh ${repo_url}tools.sh && chmod +x tools.sh && clear && ./tools.sh "
    yellow " =================================================="
    green " 1. " 
    green " 2. "
    green " 3. "
    green " 4. " 
    green " 5. "
    green " 6. "
    green " 7. "
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
