FROM my/cluster/base
COPY init-etcd /opt/cluster/init/
COPY init-tinc /opt/cluster/init/
COPY init-skydns /opt/cluster/init/
COPY skydns.service /etc/systemd/system/
COPY skydns.PKGBUILD /tmp/skydns/PKGBUILD
COPY skydock.PKGBUILD /tmp/skydock/PKGBUILD
COPY etcd-after.conf /etc/systemd/system/etcd.service.d/
COPY skydock.plugin /etc/skydock/skydock.plugin
RUN cd /tmp && \
    chown -R user:user skydns skydock && \
    cd skydns && sudo -u user makepkg --noconfirm -si && cd .. && \
    cd skydock && sudo -u user makepkg --noconfirm -si && cd .. && \
    rm -r skydns skydock && \
    clusterinit commit
ENTRYPOINT ["/lib/systemd/systemd"]
