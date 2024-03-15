#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-dev

clear

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本脚本。"
echo "本脚本仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本脚本所造成的任何损失或损害，作者不承担任何责任。"

sleep 1

# 导入配置文件
source "repo_url.conf"

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

#修改主机名
function hostname(){
wget -O change_hostname.sh ${repo_url}systools/change_hostname.sh && chmod +x change_hostname.sh && ./change_hostname.sh
}

#修改时区
function timezone(){
wget -O timezone.sh ${repo_url}systools/timezone.sh && chmod +x timezone.sh && ./timezone.sh
}

#IPv4/6优先级切换
function ipv(){
wget -O ipv-switch.sh ${repo_url}systools/ipv-switch.sh && chmod +x ipv-switch.sh && ./ipv-switch.sh
}

#网络侧信息查看
function networkinfo(){
wget -O networkinfo.sh ${repo_url}systools/networkinfo.sh && chmod +x networkinfo.sh && ./networkinfo.sh
}

#修改DNS
function change_dns(){
wget -O change_dns.sh ${repo_url}systools/change_dns.sh && chmod +x change_dns.sh && ./change_dns.sh
}

#BBR管理面板
function bbr-manager(){
wget -O bbr-manager.sh ${repo_url}systools/bbr-manager.sh && chmod +x bbr-manager.sh && ./bbr-manager.sh
}

#端口占用检测
function check_port_usage(){
wget -O check_port_usage.sh ${repo_url}systools/check_port_usage.sh && chmod +x check_port_usage.sh && ./check_port_usage.sh
}

#UFW防火墙
function ufw(){
wget -O ufw.sh ${repo_url}systools/ufw.sh && chmod +x ufw.sh && ./ufw.sh    
}

#SWAP虚拟内存设置
function swap(){
wget -O swap.sh ${repo_url}systools/swap.sh && chmod +x swap.sh && ./swap.sh    
}

#用户管理
function user_management(){
wget -O user_management.sh ${repo_url}systools/user_management.sh && chmod +x user_management.sh && ./user_management.sh
}

#修改root密码
function change-root-password(){
wget -O change-root-password.sh ${repo_url}systools/change-root-password.sh && chmod +x change-root-password.sh && ./change-root-password.sh
}

#创建普通用户
function create_user(){
wget -O create_user.sh ${repo_url}systools/create_user.sh && chmod +x create_user.sh && ./create_user.sh
}

#生成强密码
function generate_strong_password(){
wget -O generate_strong_password.sh ${repo_url}systools/generate_strong_password.sh && chmod +x generate_strong_password.sh && ./generate_strong_password.sh    
}

#新建SSH连接
function ssh_connect(){
wget -O ssh_connect.sh ${repo_url}systools/ssh_connect.sh && chmod +x ssh_connect.sh && ./ssh_connect.sh    
}

#重启
function reboot(){
echo "即将重启"
sleep 3    
reboot    
}

#返回主脚本
function back(){
    wget -O main.sh ${repo_url}main.sh && chmod +x main.sh && ./main.sh
}

#主菜单
function start_menu(){
    clear
    yellow " WJQserver Studio的快捷工具箱 BETA版 "
    green " WJQserver Studio tools BETA" 
    yellow " FROM: https://github.com/WJQSERVER/tools-dev "
    green " USE:  wget -O tools.sh ${repo_url}tools.sh && chmod +x tools.sh && clear && ./tools.sh "
    yellow " =================================================="
    green " 1. 修改主机名" 
    green " 2. 修改时区"
    yellow " =================================================="
    green " 3. IPv4/6优先级切换"
    green " 4. 网络侧信息查看" 
    green " 5. 修改DNS"
    green " 6. BBR管理面板"
    green " 7. 端口占用检测"
    green " 8. UFW防火墙"
    yellow " =================================================="
    green " 9. SWAP虚拟内存设置"
    yellow " =================================================="
    green " 10.用户管理"
    green " 11.修改root密码"
    green " 12.创建普通用户"
    green " 13.生成强密码"
    yellow " =================================================="
    green " 14.新建SSH连接"
    yellow " =================================================="
    green " 99.重启"
    yellow " =================================================="
    green " 0. 返回主脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
         hostname
	     ;;
        2 )
	        timezone
        ;;
	     3 )
          ipv-switch
	     ;;
        4 )
	       networkinfo
        ;;
	     5 )
           change_dns
	     ;;
        6 )
	       bbr-manager
        ;;
	     7 )
           check_port_usage
	     ;;
        8 )
           ufw
        ;;
        9 )
           swap
        ;;
        10)
           user_management
        ;;
        11)
           change-root-password
        ;;
        12)
           create_user
        ;;
        13)
           generate_strong_password
        ;;
        14)
           ssh_connect
        ;;
        99)
           reboot
        ;;         

        0)
          back
        ;;
	
        * )
            clear
            red "请输入正确数字 !"
            start_menu
        ;;
    esac
}
start_menu "first"
