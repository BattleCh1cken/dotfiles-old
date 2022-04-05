#!/bin/bash

installYay(){
  cd ~
  git clone "https://aur.archlinux.org/yay.git"
  cd ~/yay
  makepkg -si --noconfirm

}
installChaotic(){
  pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
  pacman-key --lsign-key FBA220DFC880C036
  pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
  if grep -q chaotic-aur /etc/pacman.conf; then
    echo "chaotic-aur already installed"
  else 
    echo "[chaotic-aur]" >> /etc/pacman.conf
    echo " Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf 
fi
}

installAur(){
while read p; do
  echo "Installing $p"
  yay -S --noconfirm --needed $p
done <~/dotfiles/pkgs/aur.txt
}

linkDotfiles(){
sh ~/dotfiles/link.sh
}

echo -ne "
0. All of the below
1. Install yay
2. Install Chaotic Aur
3. Link dotfiles
"
read choice
case "$choice" in
0) installYay installChaotic linkDotfiles 
  ;;
1) installYay
  ;; 
2) installChaotic
  ;;
3) linkDotfiles
  ;;
*) echo "Please choose a valid option." 
  ;;
esac


