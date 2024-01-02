#!/bin/bash

######################################
# 简单菜单选择器脚本
# 提供一个交互式菜单，根据用户选择执行相应操作
######################################

# 清空屏幕
    clear

#常量
repo_url="https://raw.githubusercontent.com/WJQSERVER/tools-dev/develop/"


# 显示菜单选项
echo "欢迎使用简单菜单选择器脚本"
echo "请选择以下选项："

# 显示菜单循环
while true; do
    echo "1. 三网回程测试"
    echo "2. 三网测速"
    echo "3. 主菜单"
    echo "4. 退出"

    # 获取用户输入
    read -p "请输入选项编号: " choice

    # 根据用户选择执行相应操作
    case $choice in
        1)
            echo "三网回程测试"
            wget -O 3mtr-back.sh ${repo_url}Test/3mtr-back.sh && chmod +x 3mtr-back.sh && ./3mtr-back.sh
            fi
            ;;
        2)
            echo "开始三网测速"
            wget -O 3speedtest.sh ${repo_url}Test/3speedtest.sh && chmod +x 3speedtest.sh && ./3speedtest.sh
            fi
            ;;
        3)
            echo "正在返回主菜单"
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
