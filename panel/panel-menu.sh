#!/bin/bash

# 清空屏幕
clear

# 常量定义
repo_url="https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/"

# 定义函数来执行选项1的操作
option1() {
wget -O bt-install.sh ${repo_url}panel/bt-install.sh && chmod +x bt-install.sh && ./bt-install.sh
}

# 定义函数来执行选项2的操作
option2() {
wget -O 1panel-install.sh ${repo_url}panel/1panel-install.sh && chmod +x 1panel-install.sh && ./1panel-install.sh
}

# 定义函数来执行选项3的操作
option3() {
wget -O serverstatus.sh ${repo_url}panel/serverstatus.sh && chmod +x serverstatus.sh && ./serverstatus.sh
}

    # 清空屏幕
    clear

    # 显示菜单
    echo "请选择一个选项："
    echo "1. 宝塔面板"
    echo "2. 1panel面板"
    echo "3. ServerStatus面板/探针"
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
