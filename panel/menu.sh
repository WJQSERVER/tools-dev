#!/bin/bash

# 清空屏幕
clear

# 常量定义
repo_url="https://raw.githubusercontent.com/WJQSERVER/tools-dev/develop/"

# 定义函数来执行选项1的操作
option1() {
    echo "执行选项1的操作"
    # 在这里执行选项1的操作
}

# 定义函数来执行选项2的操作
option2() {
    echo "执行选项2的操作"
    # 在这里执行选项2的操作
}

# 定义函数来执行选项3的操作
option3() {
    echo "执行选项3的操作"
    # 在这里执行选项3的操作
}

# 主循环
while true; do
    # 清空屏幕
    clear

    # 显示菜单
    echo "请选择一个选项："
    echo "1. 选项1"
    echo "2. 选项2"
    echo "3. 选项3"
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

    # 暂停一段时间以便用户查看输出
    sleep 2
done
