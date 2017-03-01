FROM jankoppe/arch:latest
LABEL maintainer "Jan Koppe <post@jankoppe.de>"

RUN useradd -m arch\
    && pacman -Syy --noconfirm\
    && pacman -S --noconfirm base-devel git vi\
    && echo "arch ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER arch
WORKDIR /home/arch
RUN git clone https://aur.archlinux.org/cower.git cower\
    && cd cower\
    && makepkg -sri --noconfirm\
    && cd ~\
    && git clone https://aur.archlinux.org/pacaur.git pacaur\
    && cd pacaur\
    && makepkg -sri --noconfirm\
    && cd ~\
    && rm -rf cower pacaur\
    && mkdir -p out

VOLUME /home/arch/out
ENV PKGDEST=/home/arch/out

ENTRYPOINT ["pacaur", "-Sm", "--noconfirm", "--noedit", "--silent"]