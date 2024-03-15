#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-dev

clear

# 显示免责声明
echo "免责声明：请阅读并同意以下条款才能继续使用本脚本。"
echo "本脚本仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo "使用本脚本所造成的任何损失或损害，作者不承担任何责任。"
echo "大部分功能非WJQserver Studio团队原创，部分功能仅提供辅助调用项目"
echo "不提供/保证任何功能的可用性，安全性，有效性，合法性"

sleep 1

# 显示确认提示
read -p "您是否同意上述免责声明？(y/n): " confirm

# 处理确认输入
if [[ $confirm != [Yy] ]]; then
    echo "您必须同意免责声明才能继续使用本程序。"
    exit 1
fi

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

#BBR管理面板
function bbr-manager(){
wget -O bbr-manager.sh ${repo_url}systools/bbr-manager.sh && chmod +x bbr-manager.sh && ./bbr-manager.sh
}

#WARP
function warp(){
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh d
}

#WARP-GO
function warp-go(){
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/warp-go.sh && bash warp-go.sh d
}

#X-UI原版
function x-ui(){
bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh) 0.3.2
}

#X-UI_F大魔改版
function x-ui_f(){
bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh) 0.3.4.4
}

#X-UI_勇哥精简版(此版本有争议)(闭源加密)(有挖矿嫌疑)(有挖矿嫌疑)
function x-ui_yg(){
wget -N https://gitlab.com/rwkgyg/x-ui-yg/raw/main/install.sh && bash install.sh
}

#3X-UI_伊朗魔改版x-ui
function 3x-ui(){
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh) v2.1.3
}

#ArgoX F大
function argox(){
    bash <(wget -qO- https://raw.githubusercontent.com/fscarmen/argox/main/argox.sh)
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
    green " 1. BBR管理面板" 
    yellow " =================================================="
    green " 2. WARP"
    green " 3. WARP-GO"
    yellow " =================================================="
    green " 4. X-UI原版" 
    green " 5. X-UI_FranzKafkaYu分支版"
    green " 6. X-UI_勇哥版(此版本有争议)(闭源且加密)(有挖矿嫌疑)"
    green " 7. 3X-UI_伊朗魔改版x-ui"
    green " 8. ArgoX"
    yellow " =================================================="
    green " 0. 返回主脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           bbr-manager
	    ;;
        2 )
	       warp
        ;;
	    3 )
           warp-go
	    ;;
        4 )
	       x-ui
        ;;
	    5 )
           x-ui_f
	    ;;
        6 )
	       x-ui_yg
        ;;
	    7 )
           3x-ui
	    ;;   
        8 )
           argox
        ;;      
        0 )
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
