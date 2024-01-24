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
echo "10. 网络侧信息查看"
echo "11. 用户管理"
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
