#!/bin/bash
jindu(){
	while :
	do
		echo -n '#'
		sleep 0.2
	done
}
jindu &
cp -a $1 $2
sleep 1
kill -9 $!
echo "拷贝完成"
