#!/bin/bash

# 清空屏幕
    clear

#常量-DEV
repo_url="https://raw.githubusercontent.com/WJQSERVER/tools-dev/main/"

# 定义函数来执行选项1的操作
A() {
   
}

# 定义函数来执行选项2的操作
B() {
   
}

# 定义函数来执行选项3的操作
C() {
  
}

    # 显示菜单
    echo "请选择一个选项："
    echo "1. A"
    echo "2. B"
    echo "3. C"
    echo "4. 退出"

    # 读取用户输入
    echo -n "请输入选项对应的编号: "
    read choice

    # 根据用户输入执行相应的操作
    case $choice in
        1)
            A
            ;;
        2)
            B
            ;;
        3)
            C
            ;;
        4)
            echo "再见！"
            exit
            ;;
        *)
            echo "无效的选项，请重新选择。"
            ;;
    esac
