#!/bin/bash
while :
do
	echo '本地网卡eth0流量信息如下：'
	ifconfig private1 | grep "RX pack" | awk '{print $5}'
	ifconfig private1 | grep "TX pack" | awk '{print $5}'
	sleep 1
done
