#!/usr/bin/env bash
# 根据输入（Yy/Nn）分别输出YES/NO，输入仅限字母y和n
read char
[[ "$char" == "Y" || "$char" == "y" ]] && echo "YES" && exit 0
[[ "$char" == "N" || "$char" == "n" ]] && echo "NO" && exit 0
echo "Invalid character!" && exit 1