pacman -S --needed $(diff <(cat badpkglist|sort) <(diff <(cat pkglist|sort) <(pacman -Slq|sort)|grep \<|cut -f2 -d' ')|grep \<|cut -f2 -d' ')

