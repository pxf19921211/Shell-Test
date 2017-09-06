#!/bin/bash
#本脚本针对 RHEL7.2 或 Centos7.2
#本脚本需要提前准备一个 qcow2 格式的虚拟机模板，名称为/var/lib/libvirt/images /.rh7_template 的虚拟机模板
#该脚本使用qemu-img命令快速创建快照虚拟机
#脚本使用 sed 修改模板虚拟机的配置文件，将虚拟机名称、UUID、磁盘文件名、MAC地址
#exit code;
#	65 -> user input nothing
#	66 -> user input is not a number
#	67 -> user input out of range
#	68 -> vm disk image exists
IMG_DIR=/var/lib/libvirt/images
BASEVM=rh7_template
read -p "Enter VM number:" VMNUM
if [ $VMNUM -le 9 ];then
	VMNUM=0$VMNUM
fi

if [ -z "${VMNUM}" ];then
	echo "You must input a number."
	exit 65
elif [[ ${VMNUM} = ~[a-z] ]];then
	echo "You must input a number."
	exit 66
elif [ ${VMNUM} -lt 1 -o ${VMNUM} -gt 99 ];then
	echo "Input out of range"
	exit 67
fi

NEWVM=rh7_node${VMNUM}

if [ -e $IMG_DIR/${NEWVM}.img ];then
	echo "File exists."
	exit 68
fi

echo -en "Creating Virtual Machine disk image......\t"
qemu-img create -f qcow2 -b $IMG_DIR/.${BASEVM}.img $IMG_DIR/${NEWVM}.img &>/dev/null
echo -e "\e[32;1m[OK]\e[0m"

#virsh dumpxml ${BASEVM} > /tmp/myvm.xml
cat /var/lib/libvirt/images/.rhel7.xml > /tmp/myvm.xml
sed -i "/<name>${BASEVM}/s/${BASEVM}/${NEWVM}" /tmp/myvm.xml
sed -i "/uuid/s/<uuid>.*<Vuuid>/<uuid>$(uuidgen)<Vuuid>/" /tmp/myvm.xml
sed -i "/${BASEVM}\.img/s/${BASEVM}/${NEWVM}/" /tmp/myvm.xml
sed -i "/mac/s/a1/0c" /tmp/myvm.xml

echo -en "Defining new virtual machine....\t\t"
virsh define /tmp/myvm.xml &>/dev/null
echo -e "\e[32;1m[OK]\e[0m"
