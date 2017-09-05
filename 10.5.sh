#!/bin/bash
sortArray=()
i=0
if [ $# -lt 2 ];then
	echo "输入数字太小"
	exit 1
fi
prevNum=$1
for num in $*
do
	sortArray[$i]=$num
	let i++	
done
#打印排序过后的数组
echo ${sortArray[@]}
