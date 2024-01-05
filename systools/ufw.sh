#!/bin/bash

# 添加警告提示
read -p "警告：执行此脚本将配置 UFW 并启用防火墙。确保您具有必要的权限并理解脚本的功能。继续吗？(Y/N): " confirm
if [[ $confirm != "Y" && $confirm != "y" ]]; then
  echo "脚本已取消。"
  exit 0
fi

# 安装 UFW
echo "正在安装 UFW..."
sudo apt-get update
sudo apt-get install ufw -y

# 配置 UFW 默认规则
echo "配置 UFW 默认规则..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

# 获取自定义 SSH 端口号
read -p "请输入自定义的 SSH 端口号: " ssh_port

# 打开自定义的 SSH 端口
echo "打开 SSH 端口 $ssh_port..."
sudo ufw allow $ssh_port

# 打开其他所需的端口
echo "打开其他所需的端口..."
sudo ufw allow 80    # 修改为您的 HTTP 端口号
sudo ufw allow 443   # 修改为您的 HTTPS 端口号

# 启用 UFW
echo "启用 UFW..."
sudo ufw enable

echo "UFW 已成功部署！"
echo "防火墙已启用，并且只允许指定的端口通过。"
