FROM base/archlinux
ENV container=docker \
    LC_ALL=en_US.UTF-8 \
    init=/lib/systemd/systemd \
    TERM=xterm-256color
RUN : Initalization of pacman/systemd environemnt && \
    sed '/\[multilib\]/,+1{s/#//g};/Color/{s/#//g;}' -i /etc/pacman.conf && \
    sed '/NAutoVTs/{s/^#//;s/=[0-9]*/=0/}' -i /etc/systemd/logind.conf && \
    sed '/nowrap/{s/^# //g}' -i /etc/nanorc && \
    : Updating base system && \
    pacman -Sy --noconfirm archlinux-keyring | cat && \
    pacman-key --init && \
    pacman-key --populate archlinux && \
    pacman -Su --noconfirm | cat && \
    pacman-db-upgrade && \
    pacman -S --noconfirm sudo git base-devel bc openssh wget unzip man && \
    : Purging excessive systemd units && \
    ( \
     find /lib/systemd/system/sysinit.target.wants/ \
          -type f \
          -not -name systemd-tmpfiles* && \
     find /etc/systemd/system/*.wants \
          /lib/systemd/system/local-fs.target.wants \
          /lib/systemd/system/systemd-update-utmp* \
          /lib/systemd/system/multi-user.target.wants/getty.target \
          /lib/systemd/system/sockets.target.wants/*{udev,initctl}* \
          -type f; \
    ) | xargs rm -f && \
    : Tuning for our environment && \
    systemctl set-default multi-user.target && \
    systemctl disable getty@tty1 && \
    : Create user account && \
    useradd -m user && \
    usermod -p "$(echo "ignore" | openssl passwd -1 -stdin)" user && \
    echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    : Yaourt && \
    cd /tmp && \
    sudo -u user git clone https://aur.archlinux.org/package-query.git && \
    cd package-query && sudo -u user makepkg --noconfirm -si && cd .. && \
    sudo -u user git clone https://aur.archlinux.org/yaourt.git && \
    cd yaourt && sudo -u user makepkg --noconfirm -si && cd .. && \
    rm -r package-query yaourt
ENTRYPOINT ["/lib/systemd/systemd"]
