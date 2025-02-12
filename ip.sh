#!/bin/sh

# 提示用户输入输入文件名
read -p "请输入输入文件名: " input_filename

# 使用 find 命令查找文件（不区分大小写）
input_file_path=$(find . -type f -iname "$input_filename" | head -n 1)

if [ -z "$input_file_path" ]; then
    echo "错误: 文件 $input_filename 未找到！"
    exit 1
fi

# 提示用户输入输出文件名
read -p "请输入输出文件名: " output_filename

# 使用用户输入的文件名进行操作
sed -i '1d' "$input_file_path" && \
sed -i '51,5000d' "$input_file_path" && \
cut -d, --complement -f2,3,4,5 "$input_file_path" > temp.csv && \
mv temp.csv "$input_file_path" && \
cp -f "$input_file_path" "/sdcard/$output_filename"
