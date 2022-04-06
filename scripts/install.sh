#!/bin/bash

installYay(){
  cd ~
  git clone "https://aur.archlinux.org/yay.git"
  cd ~/yay
  makepkg -si --noconfirm

}
installChaotic(){
  sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key FBA220DFC880C036
  sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
  if grep -q chaotic-aur /etc/pacman.conf; then
    echo "chaotic-aur already installed"
  else 
    sudo echo "[chaotic-aur]" >> /etc/pacman.conf
    sudo echo " Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf 
fi
}

installNVChad(){
  if test -d ~/.config/nvim; then
    echo "existing nvim config detected, delete it first"
  else {
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
    ln -s ~/dotfiles/.config/NvChad/custom ~/.config/nvim/lua/ 
  }
  fi
}
installPackages(){
  yay -S --noconfirm --needed awesome-git kitty rofi picom neovim ripgrep 
}

linkDotfiles(){
sh ~/dotfiles/link.sh
}

echo -ne "
0. All of the below
1. Install yay
2. Install Chaotic Aur
3. Install NvChad
4. Link dotfiles
"
read choice
case "$choice" in
0) installYay installChaotic installPackages linkDotfiles 
  ;;
1) installYay
  ;; 
2) installChaotic
  ;;
3) installNVChad
  ;;
4) linkDotfiles
  ;;
*) echo "Please choose a valid option." 
  ;;
esac


