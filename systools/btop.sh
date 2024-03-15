#! /bin/bash

# 检测发行版类型
if [ -f /etc/os-release ]; then
    source /etc/os-release
    DISTRIBUTION=$ID
elif [ -f /etc/redhat-release ]; then
    DISTRIBUTION="rhel"
elif [ -f /etc/openwrt_release ]; then
    DISTRIBUTION="openwrt"
elif [ -f /etc/alpine-release ]; then
    DISTRIBUTION="alpine"    
else
    echo "暂不支持该发行版"
    exit 1
fi

case $DISTRIBUTION in
    "ubuntu")
        apt install btop
        btop
        ;;
    "debian")
        apt install btop
        btop
        ;;
    "centos" | "rhel")
        yum install epel-release
        yum install btop
        btop
        ;;
    "openwrt")
        opkg install btop
        btop
        ;;
    "alpine")
        apk add btop
        btop
        ;;    
    *)
        echo "暂不支持该发行版"
        exit 1
        ;;
esac