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

#
function (){

}

#
function (){

}

#
function (){

}

#
function (){

}

#
function (){

}

#
function (){

}

#
function (){

}

#主菜单
function start_menu(){
    clear
    red " WJQserver Studio tools BETA" 
    green " WJQserver Studio的快捷工具箱 BETA版 "
    green " FROM: https://github.com/WJQSERVER/tools-dev "
    green " USE:  wget -O tools.sh ${repo_url}tools.sh && chmod +x tools.sh && clear && ./tools.sh "
    green " =================================================="
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
           #
	    ;;
        2 )
	       #
        ;;
	    3 )
           #
	    ;;
        4 )
	       #
        ;;
	    5 )
           #
	    ;;
        6 )
	       #
        ;;
	    7 )
           #
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
