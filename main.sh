#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/shell

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本程序。"
echo "本程序仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本程序所造成的任何损失或损害，作者不承担任何责任。"

# 显示确认提示
read -p "您是否同意上述免责声明？(y/n): " confirm

# 处理确认输入
if [[ $confirm != [Yy] ]]; then
    echo "您必须同意免责声明才能继续使用本程序。"
    exit 1
fi

# 确认执行操作
read -p "此操作将安装 wget, curl, vim 等常用软件包并进行更新。是否继续？(不进行此操作可能造成脚本异常)(y/n) " choice

if [[ $choice == "y" ]]; then
  # 安装软件包
  apt update
  sudo apt upgrade -y
  apt install wget curl vim git sudo -y
fi

#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}

#Docker及Docker-compose一键安装脚本
function dockersh(){
wget -O docker.sh https://raw.githubusercontent.com/WJQSERVER/shell/main/docker.sh && chmod +x docker.sh && clear && ./docker.sh
}

#SWAP一键脚本
function swapsh(){
wget -O swap.sh https://raw.githubusercontent.com/WJQSERVER/shell/main/swap.sh && chmod +x swap.sh && clear && ./swap.sh
}

#Nginx Proxy Manager一键部署脚本
function npmsh(){
wget -O nginxproxymanager.sh https://raw.githubusercontent.com/WJQSERVER/shell/main/nginxproxymanager.sh && chmod +x nginxproxymanager.sh && clear && ./nginxproxymanager.sh
}

#Portainer中文版一键部署
function portainersh(){
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /dockerData/portainer:/data --restart=always --name portainer 6053537/portainer-ce:latest
echo "可以通过 http://<服务器IP>:9000 访问 Portainer。"
}

#网络信息查看
function ipsh(){
wget -O ipsh.sh https://raw.githubusercontent.com/WJQSERVER/shell/main/ipsh.sh && chmod +x ipsh.sh && clear && ./ipsh.sh
}

#三网回程线路测试
function 3mtr-back(){
curl https://raw.githubusercontent.com/zhanghanyun/backtrace/main/install.sh -sSf | sh
}

#三网测速
function 3speedtest(){
bash <(curl -Lso- https://git.io/superspeed)
}

#主菜单
function start_menu(){
    clear
    red " WJQserver Studio tools" 
    green " 由WJQserver Studio提供的快捷工具箱 "
    green " FROM: https://github.com/WJQSERVER/shell "
    green " USE:  wget -O menu.sh https://raw.githubusercontent.com/WJQSERVER/shell/main/menu.sh && chmod +x menu.sh && clear && ./menu.sh "
    yellow " =================================================="
    green " 1. 网络信息查看" 
    green " 2. Unavailable"
    green " 3. Unavailable"
    green " 4. Unavailable" 
    green " 5. Unavailable"
    green " 6. Unavailable"
    green " 7. Unavailable"
    yellow " --------------------------------------------------"
    green " 11. Docker和Docker-compose安装"
    green " 12. SWAP一键安装/卸载脚本" 
    green " 13. Unavailable"
    green " 14. Unavailable"
    green " 15. Unavailable"
    green " 16. Unavailable"
    green " 17. Unavailable" 
    green " 18. Unavailable"
    green " 19. Unavailable"
    yellow " --------------------------------------------------"
    green " 21. Nginx Proxy Manager一键部署脚本"
    green " 22. Portainer中文版一键部署"
    green " 23. Unavailable"
    green " 24. Unavailable"
    green " 25. Unavailable"
    green " 26. Unavailable"
    green " 27. Unavailable"
    green " 28. Unavailable"
    green " 29. Unavailable"
    yellow " --------------------------------------------------"
    green " 31. Unavailable"
    green " 32. Unavailable"
    green " 33. Unavailable"
    yellow " --------------------------------------------------"
    green " 00. Unavailable"
    green " =================================================="
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           ipsh
	;;
        2 )
           iptsh
	;;
        3 )
           speedtest-linux
	;;
        4 )
           clonesh
        ;;
	11 )
            dockersh
	;;    
	12 )
            swapsh
        ;;
        21 )
	    npmsh
        ;;
	22 )
            portainersh
	;;    
        0 )
            exit 1
        ;;
	
        * )
            clear
            red "请输入正确数字 !"
            start_menu
        ;;
    esac
}
start_menu "first"
