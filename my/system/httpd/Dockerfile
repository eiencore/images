FROM my/base/arch
RUN pacman -Syu --noconfirm nginx && \
    sudo -u user yaourt -S --noconfirm etcd && \
    systemctl enable nginx && \
    systemctl enable etcd
