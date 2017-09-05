#!/bin/bash
if [ $USER == "root" ] || [ $UID -eq 0 ];then
	yum -y install vsftpd
else
	echo "您不是管理员，没有权限安装软件"
fi

