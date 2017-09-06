#!/bin/bash
#定义一个显示进度的函数，屏幕快速显示|/-\
rotate_line(){
	INTERVAL=0.1
	COUNT="0"
	while :
	do
		COUNT=`expr $COUNT + 1`
		case $COUNT in
		"1")
			echo -e '-'"\b\c"
			;;
		"2")
			echo -e '\\'"\b\c"
			;;
		"3")
			echo -e "|\b\c"
			;;
		"4")
			echo -e "/\b\c"
			;;
		*)
			COUNT="0"
			;;
		esac
		sleep $INTERVAL
	done
}
rotate_line
