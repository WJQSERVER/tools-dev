#!/bin/bash

# 提示用户输入当前root密码
read -s -p "请输入当前的root密码: " current_password
echo

# 验证当前密码是否正确
echo "$current_password" | sudo -S echo "密码验证"
if [ $? -ne 0 ]; then
  echo "当前root密码不正确。操作中止。"
  exit 1
fi

# 提示用户输入新的root密码
read -s -p "请输入新的root密码: " new_password1
echo

# 提示用户再次输入新的root密码进行确认
read -s -p "请再次输入新的root密码进行确认: " new_password2
echo

# 检查两次输入的密码是否一致
if [ "$new_password1" != "$new_password2" ]; then
  echo "两次输入的密码不一致。操作中止。"
  exit 1
fi

# 使用root权限修改密码
echo "root:$new_password1" | sudo chpasswd

# 检查密码修改是否成功
if [ $? -eq 0 ]; then
  echo "root密码修改成功。"
else
  echo "无法修改root密码。"
fi
