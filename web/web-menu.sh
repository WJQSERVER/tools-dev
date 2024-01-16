#!/bin/bash

# 清空屏幕
clear

# 常量定义
repo_url="https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/"

# 定义函数来执行选项1的操作
option1() {
    wget -O halo.sh ${repo_url}web/halo.sh && chmod +x halo.sh && ./halo.sh
}

# 定义函数来执行选项2的操作
option2() {
    wget -O wordpress.sh ${repo_url}web/wordpress.sh && chmod +x wordpress.sh && ./wordpress.sh
}

# 定义函数来执行选项3的操作
option3() {
    echo "执行选项3的操作"
    # 在这里执行选项3的操作
}

    # 清空屏幕
    clear

    # 显示菜单
    echo "请选择一个选项："
    echo "1. Halo"
    echo "2. WordPress"
    echo "3. 返回主菜单"
    echo "4. 退出"

    # 提示用户输入选项编号
    echo -n "请输入选项对应的编号: "
    read choice

    # 根据用户输入执行相应的操作
    case $choice in
        1)
            option1
            ;;
        2)
            option2
            ;;
        3)
            option3
            ;;
        4)
            echo "再见！"
            exit
            ;;
        *)
            echo "无效的选项，请重新选择。"
            ;;
    esac
