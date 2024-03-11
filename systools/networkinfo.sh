#!/bin/bash

apt install ethtool

# 获取本地网络信息
interface=$(ip -o -4 route show to default | awk '{print $5}')
local_ipv4=$(ip -4 addr show dev $interface | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
local_ipv6=$(ip -6 addr show dev $interface | grep -oP '(?<=inet6\s)[\da-fA-F:]+')
gateway=$(ip route | grep default | awk '{print $3}')
subnet_mask=$(ip -4 addr show dev $interface | grep -oP '(?<=inet\s)\d+(\.\d+){3}/\d+')
dns_servers=$(awk '/^nameserver/ {print $2}' /etc/resolv.conf)
model=$(ethtool -i $interface | awk '/^driver:/ {print $2}')
speed=$(ethtool $interface | awk '/Speed:/ {print $2}')
duplex=$(ethtool $interface | awk '/Duplex:/ {print $2}')

# 获取公网IP
public_ipv4=$(curl 4.ipw.cn )
public_ipv6=$(curl 6.ipw.cn )

# 输出结果
echo "本地网络信息："
echo "接口名称: $interface"
echo "IPv4地址: $local_ipv4"
echo "IPv6地址: $local_ipv6"
echo "网关: $gateway"
echo "子网掩码: $subnet_mask"
echo "DNS服务器: $dns_servers"
echo "公网IPv4地址: $public_ipv4"
echo "公网IPv6地址: $public_ipv6"
echo "网卡型号: $model"
echo "网卡速率: $speed"
echo "双工状态: $duplex"
echo "链路状态: $(ip link show dev $interface | awk '/state/ {print $9}')"

#回到root目录
cd /root

# 导入配置文件
source "repo_url.conf"

#等待1s
sleep 1

#返回菜单/退出脚本
read -p "是否返回菜单?: [Y/n]" choice

if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
    wget -O systools-menu.sh ${repo_url}systools/systools-menu.sh && chmod +x systools-menu.sh && ./systools-menu.sh
else
    echo "脚本结束"
fi