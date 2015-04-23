#!/usr/bin/env bash

parted /dev/sdb mklabel msdos
parted /dev/sdb mkpart primary 0 100%
mkfs.ext3 /dev/sdb1
mkdir /mnt/disk
echo `blkid /dev/sdb1 | awk '{print$2}' | sed -e 's/"//g'` /mnt/disk   ext3   noatime,nobarrier   0   0 >> /etc/fstab
mount /mnt/disk
