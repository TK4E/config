#!/bin/bash


pacstrap -i /mnt base linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
