#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-dev

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本程序。"
echo "本脚本仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本脚本所造成的任何损失或损害，作者不承担任何责任。"
echo "本脚本用于链接到其他作者的脚本，不做任何保证"

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

#SKY-BOX
function skybox(){
wget -O box.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && clear && ./box.sh
}

#科技Lion
function kejilion(){
curl -sS -O https://raw.githubusercontent.com/kejilion/sh/main/kejilion.sh && chmod +x kejilion.sh && ./kejilion.sh
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

}

#网站部署菜单7
function web(){

}

#主菜单
function start_menu(){
    clear
    red " WJQserver Studio tools DEV" 
    green " 由WJQserver Studio提供的快捷工具箱 DEV版 "
    green " FROM: https://github.com/WJQSERVER/tools-dev "
    green " USE:  wget -O tools.sh ${repo_url}tools.sh && chmod +x tools.sh && clear && ./tools.sh "
    red " 本脚本仅用于链接到其他作者的脚本，不做任何保证 "
    yellow " =================================================="
    green " 1. SKY-BOX_BlueSkyXN综合工具箱" 
    green " 2. 科技Lion的脚本"
    green " 3. XX"
    green " 4. XX" 
    green " 5. XX"
    green " 6. XX"
    green " 7. XX"
    green " =================================================="
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           skybox
	    ;;
        2 )
	       kejilion
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
