#!/bin/bash
#执行脚本时，需要给脚本添加为值参数
#脚本名 txt doc (可以将txt的扩展名修改为doc)
#脚本名 doc jpg（可以将doc的扩展名修改为jpg）
for i in `ls *.$1`
do
	mv $i ${i%.*}.$2	#去除最后以点结尾及其右边的字符串
done
