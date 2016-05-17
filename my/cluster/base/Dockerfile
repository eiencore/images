FROM my/base/arch
ENV PATH="$PATH:/opt/cluster/bin"
COPY avahi-nodroproot.conf /etc/systemd/system/avahi-daemon.service.d/
COPY clusterinit /opt/cluster/bin/
COPY clusterinit.service /etc/systemd/system/
RUN pacman -Sy --noconfirm nss-mdns avahi | cat && \
    sed '/.*\(allow-interfaces\).*/{s//\1=cluster/}' -i /etc/avahi/avahi-daemon.conf && \
    mkdir -p /opt/cluster/{init,layers} && \
    echo 'PATH="$PATH:/opt/cluster/bin"' > /etc/profile.d/10-path.sh && \
    sed '/hosts:/{s/dns/mdns_minimal [NOTFOUND=return] dns/}' -i /etc/nsswitch.conf && \
    echo 'X11Forwarding yes' >> /etc/ssh/sshd_config && \
    sudo -u user yaourt -S --noconfirm tinc-pre-git && \
    systemctl enable clusterinit && \
    systemctl enable avahi-daemon && \
    clusterinit commit
ENTRYPOINT ["/lib/systemd/systemd"]
