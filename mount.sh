#!/bin/bash
[ ! $EUID -eq 0 ] && echo "Not root." && exit 1

. config

LOOPD=`losetup --find --show "$CONTAINER"`
cryptsetup create "$CRYPTNAME" $LOOPD
mount -o uid=1000,gid=1000 -t vfat "/dev/mapper/${CRYPTNAME}" $TARGET
