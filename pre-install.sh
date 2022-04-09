#!/bin/sh

install_aura() {
    git clone https://aur.archlinux.org/aura-bin.git
    cd aura-bin || exit 1
    makepkg --sync --install
    cd .. || exit 2
    rm -rf aura-bin
}

install_aura
