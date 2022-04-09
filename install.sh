#!/bin/sh

install_packages() {
  while IFS= read -r package
  do
    sudo pacman --sync --noconfirm --needed "$package"
  done < "packages.txt"
}

install_aur_packages() {
  while IFS= read -r package
  do
    sudo aura --aursync --noconfirm --needed "$package"
  done < "packages-aur.txt"
}

install_packages
install_aur_packages
