#!/bin/bash

# 获取本地网络信息
interface=$(ip -o -4 route show to default | awk '{print $5}')
local_ipv4=$(ip -4 addr show dev $interface | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
local_ipv6=$(ip -6 addr show dev $interface | grep -oP '(?<=inet6\s)[\da-fA-F:]+')
gateway=$(ip route | grep default | awk '{print $3}')
subnet_mask=$(ip -4 addr show dev $interface | grep -oP '(?<=inet\s)\d+(\.\d+){3}/\d+')
dns_servers=$(awk '/^nameserver/ {print $2}' /etc/resolv.conf)

# 获取公网IP
public_ipv4=$(curl -s https://httpbin.org/ip | grep -oP '(?<=origin": ")[^"]+')

# 输出结果
echo "本地网络信息："
echo "接口名称: $interface"
echo "IPv4地址: $local_ipv4"
echo "IPv6地址: $local_ipv6"
echo "网关: $gateway"
echo "子网掩码: $subnet_mask"
echo "DNS服务器: $dns_servers"

echo "IPv4地址: $public_ipv4"
