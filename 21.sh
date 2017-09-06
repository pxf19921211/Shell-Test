#!/bin/bash
#删除～/.ssh/known_hosts后，ssh远程任何主机都会询问是否确认要连接该主机
rm -rf ~/.ssh/known_hosts
expect <<EOF
spawn ssh 192.168.4.254
expect "yes/no" {send "yes\r"}
#根据自己的实际情况将密码修改为真实的密码子串
expect "password" {send "密码\r"}
expect "#" {send "yum -y install httpd\r"}
expect "#" {send "exit\r"}
EOF
