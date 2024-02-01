#!/bin/bash

# 清空屏幕
clear

# 导入配置文件
source "repo_url.conf"

# 修改root密码
1() {
wget -O change-root-password.sh ${repo_url}systools/change-root-password.sh && chmod +x change-root-password.sh && ./change-root-password.sh
}

# 创建普通用户
2() {
wget -O create_user.sh ${repo_url}systools/create_user.sh && chmod +x create_user.sh && ./create_user.sh
}

# 修改主机名
3() {
wget -O change_hostname.sh ${repo_url}systools/change_hostname.sh && chmod +x change_hostname.sh && ./change_hostname.sh
}

#修改ssh端口
4() {
wget -O change_ssh_port.sh ${repo_url}systools/change_ssh_port.sh && chmod +x change_ssh_port.sh && ./change_ssh_port.sh
}

#检查端口占用
5() {
wget -O check_port_usage.sh ${repo_url}systools/check_port_usage.sh && chmod +x check_port_usage.sh && ./check_port_usage.sh
}

#修改时区
6() {
wget -O timezone.sh ${repo_url}systools/timezone.sh && chmod +x timezone.sh && ./timezone.sh
}

#开启UFW防火墙
7() {
wget -O ufw.sh ${repo_url}systools/ufw.sh && chmod +x ufw.sh && ./ufw.sh
}

#修改SWAP虚拟内存设置
8() {
wget -O swap.sh ${repo_url}systools/swap.sh && chmod +x swap.sh && ./swap.sh
}

#修改DNS
9() {
wget -O change_dns.sh ${repo_url}systools/change_dns.sh && chmod +x change_dns.sh && ./change_dns.sh
}
#网络侧信息查看
10() {
wget -O networkinfo.sh ${repo_url}systools/networkinfo.sh && chmod +x networkinfo.sh && ./networkinfo.sh
}
#用户管理
11() {
wget -O user_management.sh ${repo_url}systools/user_management.sh && chmod +x user_management.sh && ./user_management.sh
}

#新建ssh
12(){
wget -O ssh_connect.sh ${repo_url}systools/ssh_connect.sh && chmod +x ssh_connect.sh && ./ssh_connect.sh    
}

#重启
99() {
reboot
}

# 显示菜单
echo "请选择一个选项："
echo "========================================="
echo "1. 修改root密码"
echo "2. 创建普通用户"
echo "3. 修改主机名"
echo "4. 修改ssh端口"
echo "5. 检查端口占用"
echo "6. 修改时区"
echo "7. 开启UFW防火墙"
echo "8. 修改SWAP虚拟内存设置"
echo "9. 修改DNS"
echo "10.网络侧信息查看"
echo "11.用户管理"
echo "12.新建SSH连接"
echo "0. 退出"
echo "=========================================="
echo "99. 重启"


# 提示用户输入选项编号
echo -n "请输入选项对应的编号: "
read choice

# 根据用户输入执行相应的操作
case $choice in
    1)
        1
        ;;
    2)
        2
        ;;
    3)
        3
        ;;
    4)
        4
        ;; 
    5)
        5
        ;;
    6)
        6
        ;;
    7)
        7
        ;;
    8)
        8
        ;;
    9)
        9
        ;;
    10)
        10
        ;;
    11)
        11
        ;;
    12)
        12
        ;;    
    99)
        99
        ;;
    0)
        echo "再见！"
        exit
        ;;
    *)
        echo "无效的选项，请重新运行脚本选择。"
        ;;
esac
#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-dev

clear

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本脚本。"
echo "本脚本仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本脚本所造成的任何损失或损害，作者不承担任何责任。"
echo "当前版本为V.0.3-BETA"
sleep 1

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

#修改主机名
function hostname(){
wget -O change_hostname.sh ${repo_url}systools/change_hostname.sh && chmod +x change_hostname.sh && ./change_hostname.sh
}

#修改时区
function timezone(){
wget -O timezone.sh ${repo_url}systools/timezone.sh && chmod +x timezone.sh && ./timezone.sh
}

#IPv4/6优先级切换
function ipv(){
wget -O ipv-switch.sh ${repo_url}systools/ipv-switch.sh && chmod +x ipv-switch.sh && ./ipv-switch.sh
}

#网络侧信息查看
function networkinfo(){
wget -O networkinfo.sh ${repo_url}systools/networkinfo.sh && chmod +x networkinfo.sh && ./networkinfo.sh
}

#修改DNS
function change_dns(){
wget -O change_dns.sh ${repo_url}systools/change_dns.sh && chmod +x change_dns.sh && ./change_dns.sh
}

#BBR管理面板
function bbr-manager(){
wget -O bbr-manager.sh ${repo_url}systools/bbr-manager.sh && chmod +x bbr-manager.sh && ./bbr-manager.sh
}

#端口占用检测
function check_port_usage(){
wget -O check_port_usage.sh ${repo_url}systools/check_port_usage.sh && chmod +x check_port_usage.sh && ./check_port_usage.sh
}

#UFW防火墙
function ufw(){
wget -O ufw.sh ${repo_url}systools/ufw.sh && chmod +x ufw.sh && ./ufw.sh    
}

#SWAP虚拟内存设置
function swap(){
wget -O swap.sh ${repo_url}systools/swap.sh && chmod +x swap.sh && ./swap.sh    
}

#用户管理
function user_management(){
wget -O user_management.sh ${repo_url}systools/user_management.sh && chmod +x user_management.sh && ./user_management.sh
}

#修改root密码
function change-root-password(){
wget -O change-root-password.sh ${repo_url}systools/change-root-password.sh && chmod +x change-root-password.sh && ./change-root-password.sh
}

#创建普通用户
function create_user(){
wget -O create_user.sh ${repo_url}systools/create_user.sh && chmod +x create_user.sh && ./create_user.sh
}

#生成强密码
function gennerate_strong_password(){
wget -O generate_strong_password.sh ${repo_url}systools/generate_strong_password.sh && chmod +x generate_strong_password.sh && ./generate_strong_password.sh    
}

#新建SSH连接
function ssh_connect(){
wget -O ssh_connect.sh ${repo_url}systools/ssh_connect.sh && chmod +x ssh_connect.sh && ./ssh_connect.sh    
}

#重启
function reboot(){
echo "即将重启"
sleep 3    
reboot    
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
