#!/bin/bash
[ ! $EUID -eq 0 ] && echo "Not root." && exit 1

. config

LOOPD=`losetup -j "$CONTAINER" | awk '{print $1}' | sed 's/://g'`
umount "/dev/mapper/${CRYPTNAME}"
cryptsetup remove "$CRYPTNAME"
losetup -d $LOOPD
