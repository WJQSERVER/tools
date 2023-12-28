#!/bin/bash

# 设置目录变量
data_dir="/root/data/docker_data/npm/data"
letsencrypt_dir="/root/data/docker_data/npm/letsencrypt"

# 创建目录
echo "正在创建目录..."
mkdir -p "$data_dir"
mkdir -p "$letsencrypt_dir"

# 创建 Docker Compose 配置文件
echo "version: '3'
services:
  app:
    image: 'chishin/nginx-proxy-manager-zh:release'
    restart: always
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - $data_dir:/data
      - $letsencrypt_dir:/etc/letsencrypt" > /root/data/docker_data/npm/docker-compose.yml

# 启动 Nginx Proxy Manager
echo "正在启动 Nginx Proxy Manager..."
docker-compose -f /root/data/docker_data/npm/docker-compose.yml up -d

echo "Nginx Proxy Manager 已成功部署！"
echo "可以通过 http://<服务器IP>:81 访问 Nginx Proxy Manager。"
