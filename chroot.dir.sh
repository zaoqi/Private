#!/bin/sh
root=/mnt/base-us/root
for d in dev dev/pts proc sys ;do
	mount -o bind /$d $root/$d || exit
done
temp="$(mktemp -d)"
mount -o bind "$temp" $root/tmp || exit
cp /etc/hostname /etc/hosts /etc/resolv.conf $root/etc/
shell=/bin/sh
if [ -f $root/bin/bash ] ;then
	shell=/bin/bash
fi
if [ -n "$1" ] ;then
	shell="$1"
fi
HOME=/root chroot $root $shell
for d in dev/pts dev proc sys tmp ;do
	umount $root/$d
done
rm -fr "$temp"
