#!/usr/bin/env bash
# 输入总数 n 及 n 个数字，求 n 个数字的平均数（保留小数点后三位）
read num
sum=0
for ((i=0;i<num;i++))
do
    read temp
    let "sum+=$temp"
done
printf "%.3f" $(echo ${sum}/${num} | bc -l)

# 其他解法
#read n
#arr=($(cat))
#arr=${arr[*]}
#printf "%.3f" $(echo $((${arr// /+}))/$n | bc -l)
