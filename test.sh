#!/bin/sh

# 显示菜单
echo "请选择要执行的操作："
echo "1. 检测可用IP"
echo "2. 启动CFNAT"
echo "3. 退出"

# 读取用户输入
read -p "请输入选项（1/2/3）：" choice

# 根据用户选择执行对应的命令
case $choice in
    1)
        echo "正在执行第一组命令..."
        cp -f 1.txt ips-v4.txt
        cp -f 2.txt ips-v6.txt
        ./cfdata
        echo "第一组命令执行完成！"
        ;;
    2)
        echo "正在执行第二组命令..."
        cp -f ip.txt ips-v4.txt
        cp -f ip.txt ips-v6.txt
        ./cfnat
        echo "第二组命令执行完成！"
        ;;
    3)
        echo "退出脚本。"
        exit 0
        ;;
    *)
        echo "无效选项，请重新运行脚本并输入 1、2 或 3。"
        exit 1
        ;;
esac
