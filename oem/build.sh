#!/bin/sh

if [ $# -lt 2 ]; then
	echo "Syntax is: $0 <firmware tarball> <kernel tarball>"
	exit
fi

firmware="$1"
kernel="$2"

mkdir -p output/eiencore output/work
tar -czvf output/eiencore/oem.tar.gz -C oemdata .
tar --strip 2 -C output/work -xvf "$firmware" ./lib/firmware
tar --wildcards -C output/work --strip 3 -xvf "$kernel" \
    './usr/lib/modules' './usr/boot/vmlinuz-*'
mv output/work/vmlinuz-* output/work/vmlinuz-custom
tar -czvf output/eiencore/opt.tar.gz -C output/work .
rm -r output/work
cp cloud-config.yml output/eiencore/
cp install.sh output/eiencore/
