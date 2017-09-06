#!/bin/bash
sortArray=()
i=0
tmp=0
if [ $# -lt 2 ];then
	echo "输入数字太少"
	exit 1
fi
#将输入赋值到新的数组中
for num in $*
do
	sortArray[$i]=$num
	let i++
done

#开始排序
for ((j = 0; j < $i; j++))
do
	for ((k = $[$j+1]; k < $i; k++))
	do
		if [ ${sortArray[$j]} -gt ${sortArray[$k]} ];then
			tmp=${sortArray[$k]}
			sortArray[$k]=${sortArray[$j]}
			sortArray[$j]=$tmp
		fi
	done
done

#打印排序过后的数组
echo ${sortArray[@]}
