#!/bin/bash

# 清理无用镜像
cleanup_images() {
    docker image prune -af
    echo "已清理无用镜像."
}

# 清理无用容器
cleanup_containers() {
    docker container prune -f
    echo "已清理无用容器."
}

# 清理无用卷
cleanup_volumes() {
    docker volume prune -f
    echo "已清理无用卷."
}

# 清理无用网络
cleanup_networks() {
    docker network prune -f
    echo "已清理无用网络."
}

# 主函数
main() {
    local cleanup_all=false

    # 检查是否提供了-c/--cleanup-all选项
    if [[ $# -gt 0 ]]; then
        case $1 in
            -c|--cleanup-all)
                cleanup_all=true
                ;;
            *)
                echo "未知选项: $1"
                echo "用法: $0 [-c|--cleanup-all]"
                exit 1
                ;;
        esac
    fi

    # 清理镜像、容器、卷和网络
    if [[ $cleanup_all == true ]]; then
        cleanup_images
        cleanup_containers
        cleanup_volumes
        cleanup_networks
    else
        echo "请选择要清理的内容:"
        echo "1. 镜像"
        echo "2. 容器"
        echo "3. 卷"
        echo "4. 网络"
        echo "5. 全部清理"
        echo "0. 取消"
        read -p "请输入选项数字: " choice

        case $choice in
            1)
                cleanup_images
                ;;
            2)
                cleanup_containers
                ;;
            3)
                cleanup_volumes
                ;;
            4)
                cleanup_networks
                ;;
            5)
                cleanup_images
                cleanup_containers
                cleanup_volumes
                cleanup_networks
                ;;
            0)
                echo "取消清理."
                ;;
            *)
                echo "无效的选项: $choice"
                ;;
        esac
    fi
}

main "$@"