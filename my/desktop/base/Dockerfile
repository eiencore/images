FROM my/x11/xorg
RUN pacman -Syu --noconfirm lightdm lightdm-gtk-greeter $(pacman -Ssq ^ttf-*) \
                            xfce4 awesome opera gnome-settings-daemon gnome-keyring \
                            skype gthumb smplayer ffmpeg accountsservice \
    | cat
