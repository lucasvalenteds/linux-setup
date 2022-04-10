#!/bin/sh

enable_services() {
  while IFS= read -r service
  do
    sudo systemctl enable "$service" --now
  done < "services.txt"
}

configure_gnome() {
  # Invert touchpad/mouse scrolling direction
  gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
  gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false

  # Enable minimize and maximize window buttons
  gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

  # Enable touchpad tap-to-click
  gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

  # Creating keyboard shortcut to open terminal using Ctrl+Alt+T
  dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Open terminal'"
  dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'gnome-terminal'"
  dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Control><Alt>t'"

  # Disable Activities hot corner
  gsettings set org.gnome.desktop.interface enable-hot-corners false

  # Set Gedit theme to Oblivion and change editor font
  gsettings set org.gnome.gedit.preferences.editor scheme "oblivion"
  gsettings set org.gnome.gedit.preferences.editor editor-font "Monospace 12"
  gsettings set org.gnome.gedit.preferences.editor use-default-font false
  gsettings set org.gnome.gedit.preferences.editor tabs-size "uint32 4"

  # Configure Nautilus to show directories before files
  gsettings set org.gtk.Settings.FileChooser sort-directories-first
}

enable_services
configure_gnome
