#!/bin/sh -e

S=192.168.1.213
D=/dev/sda
H=$0
siz=1
T=$(curl https://discovery.etcd.io/new?size=$siz)

curl "http://${S}/eiencore/cloud-config.yml" | \
	sed "s|@@HOSTNAME@@|${H}|g;s|@@DISCOVERY@@|${T}|g" > cloud-config.yml

wget "https://raw.githubusercontent.com/coreos/init/master/bin/coreos-install"
chmod +x coreos-install

./coreos-install -d "${D}" -c cloud-config.yml -V current -C alpha

mount "${D}6" /mnt
curl "http://${S}/eiencore/oem.tar.gz" | tar -C /mnt -xzvf-
umount /mnt

mount "${D}9" /mnt
mkdir -p /mnt/opt/oem
curl "http://${S}/eiencore/opt.tar.gz" | tar -C /mnt/opt/oem -xzvf-
umount /mnt

echo eiencore done

