#!/bin/bash

clear

# 检查是否已经安装 Docker 和 Docker Compose
if ! command -v docker >/dev/null || ! command -v docker-compose >/dev/null; then
    echo "请先安装 Docker 和 Docker Compose。"
    exit 1
fi

# 创建目录
mkdir -p /root/data/docker_data/jdrabbit
cd /root/data/docker_data/jdrabbit

# 从用户输入中获取容器端口
read -p "请输入容器端口: " PORT

#拉取镜像
docker pull ht944/rabbitpro:latest

# 创建 docker-compose.yml 文件
cat > docker-compose.yml <<EOF
version: '3.9'
services:
    rabbitpro:
        image: 'ht944/rabbitpro:latest'
        tty: true
        stdin_open: true
        volumes:
            - './data:/Rabbit/data'
        ports:
            - '$PORT:1234'
        container_name: rabbitpro

EOF

# 启动容器
docker-compose up -d

# 提示服务访问地址
echo "服务已成功启动！"
echo "请访问以下地址来访问您的服务："
echo "http://<服务器IP>:$PORT"

#回到root目录
cd /root

# 导入配置文件
source "repo_url.conf"

#等待1s
sleep 1

#返回菜单/退出脚本
read -p "是否返回菜单?: [Y/n]" choice

if [[ "$choice" == "" || "$choice" == "Y" || "$choice" == "y" ]]; then
    echo "back2memu_changeme"
else
    echo "脚本结束"
fi