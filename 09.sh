#!/bin/bash
read -p "请输入用户名：" user
#使用-z 可以判断一个变量是否为空，如果为空，提示用户必须输入账户名，并退出脚本，退出码为2
#没有输入用户名脚本退出后，使用 $? 查看的返回码为2
if [ -z $user ];then
	echo "您必须输入账户名"
	exit 2
fi
#使用stty -echo 关闭shell的回显功能
#使用stty echo打开shell的回显功能
stty -echo
read -p "请输入密码：" pass
stty echo
pass=${pass:-123456}	#假如$pass没有设定或为控制，则使用123456
useradd "$user"
echo "$pass" | passwd --stdin "$user"
