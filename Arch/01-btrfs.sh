#!/bin/bash

# cfdisk

mkfs.btrfs -m single -L btrfs-arch /dev/sda1
mount -o compress-force=zstd /dev/sda1 /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@root
btrfs subvolume create /mnt/@snapshots


umount /mnt
mount -o noatime,nodiratime,compress-force=zstd,subvol=@ /dev/sda1 /mnt
mkdir -p /mnt/{btrfs-root,root,home,.snapshots}
mount -o noatime,nodiratime,compress-force=zstd,subvol=@home /dev/sda1 /mnt/home
mount -o noatime,nodiratime,compress-force=zstd,subvol=@root /dev/sda1 /mnt/root
mount -o noatime,nodiratime,compress-force=zstd,subvol=@snapshots /dev/sda1 /mnt/.snapshots

mount -o noatime,nodiratime,compress-force=zstd,subvol=/ /dev/sda1 /mnt/btrfs-root
