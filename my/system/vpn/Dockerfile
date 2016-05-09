FROM my/base/arch
RUN pacman -Syu --noconfirm tinc && \
    systemctl enable tinc@cluster
