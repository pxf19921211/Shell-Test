#!/bin/bash
#本脚本执行，需要提前准备一个user.txt文件，该文件包含若干用户名信息
for i in `cat user.txt`
do
	useradd $i
	echo "123456" | passwd --stdin $i
done
