#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-dev

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本程序。"
echo "本程序仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本程序所造成的任何损失或损害，作者不承担任何责任。"
echo "当前版本为V.0.2-BETA。"

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

#Docker一键安装&更新
function docker-install(){

}

#查看Docker状
function docker-info(){

}

#
function docker-container(){

}

#
function docker-image(){

}

#
function docker-network(){

}

#
function docker-volume(){

}

#
function docker-rm-unused(){

}

#
function docker-remove(){

}

#
function back-a(){

}

#主菜单
function start_menu(){
    clear
    red " WJQserver Studio tools BETA" 
    green " 由WJQserver Studio提供的快捷工具箱 BETA版 "
    green " FROM: https://github.com/WJQSERVER/tools-dev "
    green " USE:  wget -O tools.sh ${repo_url}tools.sh && chmod +x tools.sh && clear && ./tools.sh "
    yellow " =================================================="
    green " 1. Docker一键安装&更新" 
    yellow " =================================================="
    green " 2. 查看Docker状态"
    yellow " =================================================="
    green " 3. Docker容器管理"
    green " 4. Docker镜像管理" 
    green " 5. Docker网络管理"
    green " 6. Docker卷管理"
    yellow " =================================================="
    green " 7. 清理未使用Docker资源"
    yellow " =================================================="
    green " 8. Docker一键卸载"
    yellow " =================================================="
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           docker-install
	    ;;
        2 )
	       docker-info
        ;;
	    3 )
           docker-container
	    ;;
        4 )
	       docker-image
        ;;
	    5 )
           docker-network
	    ;;
        6 )
	       docker-volume
        ;;
	    7 )
           docker-rm-unused
	    ;;   
        8 )
           docker-remove
        ;;
        0 )
            back-a
        ;;
	
        * )
            clear
            red "请输入正确数字 !"
            start_menu
        ;;
    esac
}
start_menu "first"
