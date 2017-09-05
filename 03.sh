#!/bin/bash
#/root/03.sh
#编写备份脚本，备份后的文件包含日期标签，防止后面的备份将前面的备份数据覆盖
#注意date命令需要使用反引号括起来
tar -czf log-`date +%Y%m%d`.tar.gz /var/log
#编写计划任务，执行备份脚本
#crontab -e
#00 03 * * 5 /root/03.sh
