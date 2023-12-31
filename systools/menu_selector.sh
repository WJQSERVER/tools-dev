#!/bin/bash

######################################
# 简单菜单选择器脚本
# 提供一个交互式菜单，根据用户选择执行相应操作
######################################

# 显示菜单选项
echo "欢迎使用简单菜单选择器脚本"
echo "请选择以下选项："

# 显示菜单循环
while true; do
    echo "1. 选项1"
    echo "2. 选项2"
    echo "3. 选项3"
    echo "4. 退出"

    # 获取用户输入
    read -p "请输入选项编号: " choice

    # 根据用户选择执行相应操作
    case $choice in
        1)
            echo "你选择了选项1"
            # 在这里执行选项1的操作
            ;;
        2)
            echo "你选择了选项2"
            # 在这里执行选项2的操作
            ;;
        3)
            echo "你选择了选项3"
            # 在这里执行选项3的操作
            ;;
        4)
            echo "再见！"
            exit
            ;;
        *)
            echo "无效的选项，请重新选择。"
            ;;
    esac

    # 清空屏幕
    clear
done