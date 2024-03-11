#!/bin/bash

clear

# 检查是否已经安装 Docker 和 Docker Compose
if ! command -v docker >/dev/null || ! command -v docker-compose >/dev/null; then
    echo "请先安装 Docker 和 Docker Compose。"
    exit 1
fi

# 创建目录
mkdir -p /root/data/docker_data/clash
cd /root/data/docker_data/clash
echo " /ᐠ｡ꞈ｡ᐟ\ "
# 创建 docker-compose.yml 文件
cat > docker-compose.yml <<EOF
version: '3'

services:
  # Clash
  clash:
    image: dreamacro/clash:latest
    container_name: clash
    volumes:
      - ./configs:/root/.config/clash
    ports:
      - "7890:7890/tcp"
      - "7890:7890/udp"
      - "9090:9090"
    restart: always

  clash-dashboard:
    image: centralx/clash-dashboard
    container_name: clash-dashboard
    ports:
      - "7880:80"
    restart: always
EOF

# 启动容器
docker-compose up --build -d

# 提示服务访问地址
echo " /ᐠ｡ꞈ｡ᐟ\ Clash已成功启动！ /ᐠ｡ꞈ｡ᐟ\ "
echo "请修改目录下的config.yaml"
echo "请访问以下地址来访问您的服务："
echo "http:/<服务器IP>:7880"

#回到root目录
cd /root

# 导入配置文件
source "repo_url.conf"

#等待1s
sleep 3

#返回菜单/退出脚本
read -p "是否返回菜单?: [Y/n]" choice

if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
    wget -O program-menu.sh ${repo_url}program/program-menu.sh && chmod +x program-menu.sh && ./program-menu.sh
else
    echo "脚本结束"
fi
