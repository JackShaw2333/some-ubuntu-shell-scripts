#!/bin/bash

#-------------------
# 1. 换源
#-------------------

printf "This is a shell script to initialize a newly install Ubuntu 20.04 in China for better experience.\n"

# 输入密码
read -p "Enter your password:\n" -s pwd
readonly pwd

printf "\"$0\" is running.\n"

# 换源
printf "Changing apt sources to speed up apt service.\n"

## 备份旧源文件
echo password | sudo -S cp /etc/apt/sources.list /etc/apt/sources.list.backup
printf "\"/etc/apt/sources.list\" is now backed up as \"/etc/apt/sources.list.backup\".\n"

## 用新源列表（清华源）覆盖旧源列表
printf "New source list from Tsinghua University is writing into \"/etc/apt/sources.list\".\n"
echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释" > /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse" >> /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list
echo ""
echo "# 预发布软件源，不建议启用" >> /etc/apt/sources.list
echo "# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse" >> /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse" >> /etc/apt/sources.list
printf "Sources list has been changed.\n"

# 换源后的更新操作
printf "Update & Upgrade using the new sources list.\n"
sudo apt update && sudo apt upgrade -y

# 提示脚本运行完毕
printf "Initialization has finished.\n"

