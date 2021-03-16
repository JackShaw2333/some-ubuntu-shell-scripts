#!/bin/bash

#-------------------
# 1. 换源
#-------------------

printf "[$0] This is a shell script to initialize a newly installed Ubuntu 20.04 in China for better experience.\n"

# 输入密码
printf "[$0] Enter your password:\n"
read -s pwd
#readonly pwd

# 换源
printf "[$0] Changing apt sources to speed up apt service.\n"

## 备份旧源文件
echo $pwd | sudo -S cp /etc/apt/sources.list /etc/apt/sources.list.backup
printf "[$0] \"/etc/apt/sources.list\" is now backed up as \"/etc/apt/sources.list.backup\".\n"

## 用新源列表（清华源）覆盖旧源列表
printf "[$0] New source list from Tsinghua University is writing into \"/etc/apt/sources.list\".\n"
echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释" | sudo tee /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
echo ""
echo "# 预发布软件源，不建议启用" | sudo tee -a /etc/apt/sources.list
echo "# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
printf "[$0] Sources list has been changed.\n"

# 换源后的更新操作
printf "[$0] Update & Upgrade using the new sources list.\n"
sudo apt update && sudo apt upgrade -y

# 提示脚本运行完毕
printf "[$0] Initialization has finished.\n"
