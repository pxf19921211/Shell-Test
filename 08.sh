#!/bin/bash
#检测本机当前用户是否为超级管理员，如果是管理员，则使用yum安装vsftpd，如果不是，则提示您非管理员（使用UID数字对比）
if [ $UID -eq 0 ];then
	yum -y install vsftpd
else
	echo "您不是管理员，没有权限安装软件"
fi
