#!/bin/bash

dd if=/dev/zero of=/dev/sdb bs=1G count=4


(
echo g     
echo n     
echo 1     
echo       
echo +3G   
echo n     
echo 2     
echo       
echo +1G   
echo w     
) | fdisk /dev/sdb


mkfs.ext4 -b 4096 -L "Big" /dev/sdb1
mkfs.ext4 -b 512 -L "Small" /dev/sdb2


mkdir -p /mnt/Data1 /mnt/Data2


mount /dev/sdb1 /mnt/Data1
mount /dev/sdb2 /mnt/Data2


chmod 500 /mnt/Data1
chmod 555 /mnt/Data2 


tune2fs -N 1024 /dev/sdb1


echo "/dev/sdb1 /mnt/Data1 ext4 defaults,noexec,ro 0 0" >> /etc/fstab
echo "/dev/sdb2 /mnt/Data2 ext4 defaults,nodev 0 0" >> /etc/fstab


mount -a