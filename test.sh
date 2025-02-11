#!/bin/bash

# 主菜单函数
main_menu() {
    echo "请选择要执行的操作："
    echo "1. 启动 cfdata"
    echo "2. 启动 cfnat"
    echo "3. 退出"
    read -p "请输入选项 (1-3): " choice

    case $choice in
        1)
            detect_ip_and_delete
            ;;
        2)
            start_cfnat
            ;;
        3)
            echo "退出脚本。"
            exit 0
            ;;
        *)
            echo "无效的选项，请重新选择。"
            main_menu
            ;;
    esac
}

# 检测IP并删除 ips-v4.txt 文件
detect_ip_and_delete() {
    echo "正在启动cfdata..."
    cp -f 1.txt ips-v4.txt
    # 例如：ip=$(curl -s ifconfig.me)
    # echo "检测到的IP: $ip"

    echo "删除 ips-v4.txt 文件..."
    rm -rf ips-v4.txt
    echo "ips-v4.txt 已删除。"

    main_menu
}

# 启动 cfnat
start_cfnat() {
    echo "正在启动 cfnat..."
    ./cfnat
    echo "cfnat 已启动。"

    main_menu
}

# 脚本入口
main_menu