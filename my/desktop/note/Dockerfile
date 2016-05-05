FROM my/desktop/base
RUN pacman -Syu --noconfirm network-manager network-manager-applet openvpn \
                            eclipse-java \
    | cat && \
    sudo -u user yaourt -S --noconfirm jdk7
