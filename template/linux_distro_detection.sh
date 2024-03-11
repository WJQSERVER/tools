#!/bin/bash

######################################
# Linux发行版检测脚本
# 支持不同发行版执行不同命令，支持常见版本，
# 按照软件源分类
######################################

# 检测发行版类型
if [ -f /etc/os-release ]; then
    # 通过解析/etc/os-release文件获取发行版信息
    source /etc/os-release
    DISTRIBUTION=$ID
elif [ -f /etc/redhat-release ]; then
    # 检测是否为Red Hat系列发行版
    DISTRIBUTION="rhel"
elif [ -f /etc/arch-release ]; then
    # 检测是否为Arch Linux发行版
    DISTRIBUTION="arch"
elif [ -f /etc/openwrt_release ]; then
    # 检测是否为OpenWrt发行版
    DISTRIBUTION="openwrt"
else
    echo "无法检测发行版类型"
    exit 1
fi

# 根据发行版类型执行相应的命令
case $DISTRIBUTION in
    "ubuntu")
        # Ubuntu发行版执行的命令
        echo "执行Ubuntu特定命令"
        # 例如：apt update
        ;;
    "debian")
        # Debian发行版执行的命令
        echo "执行Debian特定命令"
        # 例如：apt-get update
        ;;
    "opensuse")
        # openSUSE发行版执行的命令
        echo "执行openSUSE特定命令"
        # 例如：zypper refresh
        ;;
    "centos" | "rhel")
        # CentOS和Red Hat发行版执行的命令
        echo "执行CentOS/Red Hat特定命令"
        # 例如：yum update
        ;;
    "arch")
        # Arch Linux发行版执行的命令
        echo "执行Arch Linux特定命令"
        # 例如：pacman -Syu
        ;;
    "openwrt")
        # OpenWrt发行版执行的命令
        echo "执行OpenWrt特定命令"
        # 例如：opkg update
        ;;
    *)
        echo "未知的发行版类型"
        exit 1
        ;;
esac
