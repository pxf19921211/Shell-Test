#!/bin/bash
#$1是执行脚本的第一个参数，￥2是执行脚本的第二个参数
useradd "$1"
echo "$2" | passwd --stdin "$1"
