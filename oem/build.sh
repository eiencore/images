#!/bin/sh

if [ $# -lt 2 ]; then
	echo "Syntax is: $0 <firmware tarball> <kernel tarball>"
	exit
fi

firmware="$1"
kernel="$2"

tar -czvf build/oem.tar.gz -C data .
mkdir build/work
tar --strip 2 -C build/work -xvf "$firmware" ./lib/firmware
tar --wildcards -C build/work --strip 3 -xvf "$kernel" \
    './usr/lib/modules' './usr/boot/vmlinuz-*'
mv build/work/vmlinuz-* build/work/vmlinuz-custom
tar -czvf build/opt.tar.gz -C build/work .
rm -r build/work

