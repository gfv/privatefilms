#!/bin/bash
[ ! $EUID -eq 0 ] && echo "Not root." && exit 1

CONTAINER="/home/gfv/.crypt/container"
TARGET="/home/gfv/.crypt/target"
CRYPTNAME="keycrypt"

LOOPD=`losetup -j "$CONTAINER" | awk '{print $1}' | sed 's/://g'`
umount "/dev/mapper/${CRYPTNAME}"
cryptsetup remove "$CRYPTNAME"
losetup -d $LOOPD
