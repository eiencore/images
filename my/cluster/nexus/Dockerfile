FROM my/cluster/base
COPY init-tinc /opt/cluster/init/
COPY init-etcd /opt/cluster/init/
COPY etcd.patch /tmp/etcd/
COPY skydns.PKGBUILD /tmp/skydns/PKGBUILD
COPY skydock.PKGBUILD /tmp/skydock/PKGBUILD
COPY skydock-log.patch /tmp/skydock/
RUN pacman -Sy --noconfirm go | cat && \
    cd /tmp && \
    chown -R user:user etcd skydns skydock && \
    sudo -u user yaourt -G --noconfirm etcd && \
    patch -d etcd -p1 < etcd/etcd.patch && \
    cd etcd && sudo -u user makepkg --noconfirm -si && cd .. && \
    cd skydns && sudo -u user makepkg --noconfirm -si && cd .. && \
    cd skydock && sudo -u user makepkg --noconfirm -si && cd .. && \
    rm -r etcd skydns skydock && \
    clusterinit commit
ENTRYPOINT ["/lib/systemd/systemd"]
