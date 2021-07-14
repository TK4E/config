if [ -f /tmp/rofi] ;then
    cat /tmp/rofi
else
    source ~/.config/zsh/.zshrc
    alias | awk -F'[ =]' '{print $1}' > /tmp/rofi
    cat /tmp/rofi
fi
