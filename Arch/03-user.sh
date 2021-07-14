#!/bin/bash


#arch-chroot /mnt

yes | LC_ALL=en_US.UTF-8 pacman -S networkmanager neovim grub
systemctl enable NetworkManager.service fcron.service

#nvim /etc/mkinitcpio.conf
#mkinitcpio -p linux


passwd root
bash pkglist.sh


#grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub --recheck
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

timedatectl set-ntp true
timedatectl status
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo 'TK4E' > /etc/hostname
hwclock --systohc


echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
echo 'ja_JP.UTF-8 UTF-8' >> /etc/locale.gen
echo 'zh_CN.UTF-8 UTF-8' >> /etc/locale.gen

chsh -s $(which zsh)


# swapfile

cd /
truncate -s 0 ./swapfile
chattr +C ./swapfile
btrfs property set ./swapfile compression none

dd if=/dev/zero of=/swapfile bs=1M count=512 status=progress
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

echo '/swapfile none swap defaults 0 0' >> /etc/fstab
echo 'tmpfs /dev/shm tmpfs defaults,size=2048M 0 0' >> /etc/fstab


useradd -m please
passwd please



btrfs property set /var/ca/pacman compression none
btrfs property set /root/Downloads compression none
