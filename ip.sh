#!/bin/sh

# 提示用户输入输入文件名
read -p "请输入输入文件名: " input_filename
input_filename=$(find . -type f -iname "$input_filename" | head -n 1)  # 不区分大小写查找文件

# 提示用户输入输出文件名
read -p "请输入输出文件名: " output_filename

# 使用用户输入的文件名进行操作
if [[ -f "$input_filename" ]]; then
    sed -i '1d' "$input_filename" && \
    sed -i '51,5000d' "$input_filename" && \
    cut -d, --complement -f2,3,4,5 "$input_filename" > temp.csv && \
    mv temp.csv "$input_filename" && \
    cp -f "$input_filename" "/sdcard/$output_filename"
else
    echo "错误: 文件 $input_filename 未找到！"
fi
