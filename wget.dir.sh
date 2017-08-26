#!/bin/sh
root=/mnt/base-us/root
mkdir -p $root
d=$(mktemp -d)
cd $d
wget -O - "http://cdimage.ubuntu.com/ubuntu-base/releases/17.04/release/ubuntu-base-17.04-base-armhf.tar.gz" | tar -xzvf - -C $root
