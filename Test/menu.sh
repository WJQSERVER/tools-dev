#!/bin/bash

# 清空屏幕
    clear

#常量
repo_url="https://raw.githubusercontent.com/WJQSERVER/tools-dev/develop/"

# 定义函数来执行选项1的操作
option1() {
    echo "三网回程测试"
    wget -O 3mtr-back.sh ${repo_url}Test/3mtr-back.sh && chmod +x 3mtr-back.sh && ./3mtr-back.sh
}

# 定义函数来执行选项2的操作
option2() {
    echo "开始三网测速"
    wget -O 3speedtest.sh ${repo_url}Test/3speedtest.sh && chmod +x 3speedtest.sh && ./3speedtest.sh
}

# 定义函数来执行选项3的操作
option3() {
    echo "正在返回主菜单"
    # 在这里执行选项3的操作
}

# 主循环
while true; do
    # 显示菜单
    echo "请选择一个选项："
    echo "1. 三网回程测试"
    echo "2. 开始三网测速"
    echo "3. 返回主菜单"
    echo "4. 退出"

    # 读取用户输入
    echo -n "请输入选项对应的编号: 
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

    # 执行完选项内的代码后，程序将继续执行下一条语句而不会进入循环
    echo "选项执行完毕"
done
