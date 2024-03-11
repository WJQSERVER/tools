#!/bin/bash

apt install lsof

# 提示用户输入端口号
read -p "请输入要查看的端口号: " port

# 检查TCP端口占用情况
tcp_result=$(sudo lsof -iTCP:$port -sTCP:LISTEN -n -P)

# 检查UDP端口占用情况
udp_result=$(sudo netstat -lnup | awk -v port="$port" '$1 ~ "udp" && $4 ~ ":'"$port"'"')

# 输出结果
if [[ -n "$tcp_result" ]]; then
  echo "占用TCP端口 $port 的进程:"
  echo "$tcp_result"
else
  echo "TCP端口 $port 未被占用."
fi

echo

if [[ -n "$udp_result" ]]; then
  echo "占用UDP端口 $port 的进程:"
  echo "$udp_result"
else
  echo "UDP端口 $port 未被占用."
fi
