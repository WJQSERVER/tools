#!/bin/bash

#DEV Only

# 检查是否以root权限运行脚本
if [[ $EUID -ne 0 ]]; then
    echo "请以root权限运行该脚本。"
    exit 1
fi

# 安装依赖项
apt update
apt install curl apt-transport-https -y

# 导入GPG密钥
curl -s https://syncthing.net/release-key.txt | apt-key add -

# 添加APT软件源
echo "deb https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/sources.list.d/syncthing.list

# 更新软件包列表
apt update

# 安装Syncthing
apt install syncthing -y

# 修改Syncthing地址
PUBLIC_IP=$(curl -s ifconfig.co)
PORT=8384

# 找到Syncthing的配置文件路径
CONFIG_FILE=$(find /home/*/.config/syncthing/config.xml)

# 修改地址为公网IP和指定端口
sed -i "s|<address>.*</address>|<address>$PUBLIC_IP:$PORT</address>|" $CONFIG_FILE

# 启动Syncthing服务
systemctl enable syncthing
systemctl start syncthing

# 打印Web界面访问地址
echo "Syncthing已成功安装和启动。您可以通过访问 http://$PUBLIC_IP:$PORT 访问Syncthing的Web界面。"

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