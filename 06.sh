#!/bin/bash
#RANDOM为系统自带的系统变量，值为0-32767的随机数
#使用取余算法将随机数变为1-100的随机数
num=$[RANDOM%100+1]
#使用read提示用户猜数字
#使用if判断用户猜数字的大小关系：-eq(等于),-ne(不等于),-gt(大于),-ge(大于等于),-lt(小于),-le(小于等于)
while :
do
	read -p "计算机生成了一个1-100的随机数，你猜：" cai
	if [ $cai -eq $num ];then
		echo "恭喜，猜对了"
		exit
	elif [ $cai -gt $num ];then
		echo "Oops,猜大了"
	else 
		echo "Oops,猜小了"
	fi
done
