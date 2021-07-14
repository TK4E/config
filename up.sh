#!/usr/bin/bash

rsync -az --delete ~/.config/{X11,alacritty,aria2,aseprite,bat,etc,fcitx5,feh,fontconfig,htop,i3,mpd,mpv,ncmpcpp,nvim,Arch,psd,qBittorrent,qt5ct,rofi,translate-shell,vifm,zathura,zsh,starship} ./


git remote add origin https://github.com/TK4E/config.git
git add .
git commit -m 'up'
git gc
git push -u -f origin main
