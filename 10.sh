#!/bin/bash
read -p "请输入一个整数：" num1
read -p "请输入一个整数：" num2
read -p "请输入一个整数：" num3
#不管谁大谁小，最后都打印 echo "$num1,$num2,$num3"
#num1中永远最小的值，num2中永远存中间值，num3永远存最大值
#如果输入的不是这样的顺序，则改变数的存储顺序，如：可以将num1和num2的值对调
tmp=0
#如果num1大于num2，就把num1和num2的值对调，确保num1变量中存在是最小值
if [ $num1 -gt $num2 ];then
	tmp=$num1
	num1=$num2
	num2=$tmp
fi

#如果num1大于num3，就把num1和num3的值对调，确保num1变量中存在是最小值
if [ $num1 -gt $num3 ];then
	tmp=$num1
	num1=$num3
	num3=$tmp
fi

#如果num2大于num3，就把num2和num3的值对调，确保num2变量中存的是小一点的值
if [ $num2 -gt $num3 ];then
	tmp=$num2
	num2=$num3
	num3=$tmp
fi
echo "排序后数据为：$num1,$num2,$num3"
