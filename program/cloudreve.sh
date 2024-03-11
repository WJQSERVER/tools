#!/bin/bash

clear

# 检查是否已经安装 Docker 和 Docker Compose
if ! command -v docker >/dev/null || ! command -v docker-compose >/dev/null; then
    echo "请先安装 Docker 和 Docker Compose。"
    exit 1
fi

# 创建目录
mkdir -p /root/data/docker_data/cloudreve
mkdir -vp /root/data/docker_data/cloudreve/{uploads,avatar} \
&& touch /root/data/docker_data/cloudreve/conf.ini \
&& touch /root/data/docker_data/cloudreve/cloudreve.db
cd /root/data/docker_data/cloudreve
# 从用户输入中获取容器端口
read -p "请输入容器端口: " PORT

# 启动容器
docker run -d \
-p $PORT:5212 \
--mount type=bind,source=<path_to_your_config>,target=./cloudreve/conf.ini \
--mount type=bind,source=<path_to_your_db>,target=./cloudreve/cloudreve.db \
-v <path_to_your_uploads>:./cloudreve/uploads \
-v <path_to_your_avatar>:./cloudreve/avatar \
cloudreve/cloudreve:latest

# 提示服务访问地址
echo "服务已成功启动！"
echo "请访问以下地址来访问您的服务："
echo "http:/<服务器IP>:$PORT"

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
