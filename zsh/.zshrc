# reboot {
mkdir -p /dev/shm/0 /tmp/php
# }

#xrdb -load /root/.config/X11/xresources
#===============================================================================
# 可执行程序目录
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/bin/app
export PATH=$PATH:$HOME/.local/bin/game
export PATH=$PATH:$HOME/.local/bin/sh
export PATH=$PATH:$HOME/.local/bin/rs
export PATH=$PATH:$HOME/.local/bin/go
export PATH=$PATH:$HOME/.local/bin/cpp
export PATH=$PATH:$HOME/.local/bin/c
export PATH=$PATH:$HOME/.local/bin/haskell
export PATH=$PATH:$XDG_DATA_HOME/cargo/bin
export PATH=$PATH:$XDG_DATA_HOME/go/bin

#-------------------------------------------------------------------------------
# 默认程序
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android
export ANDROID_AVD_HOME="$XDG_DATA_HOME"/android
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export BROWSER=/bin/firefox-developer-edition
export EDITOR=/bin/nvim
export IPFS_PATH="/tmp/ipfs"
export MANPAGER="/bin/sh -c \"col -b | nvim -i NONE -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
export TASKDATA="$XDG_CONFIG_HOME"/task
export TASKRC="$XDG_CONFIG_HOME"/task/.taskrc


#===============================================================================
# MY
export MY_ANIME=$HOME/An
export MY_BT=$HOME/BT
export MY_DOWNLOADS=$HOME/Downloads
export MY_EH=$HOME/Manga/EH
export MY_GAME=$HOME/Game
export MY_IMAGES=$HOME/Images
export MY_MANGA=$HOME/Manga
export MY_MUSIC=$HOME/Music
export MY_SHM=/dev/shm/0
export MY_TRASH=$HOME/.local/share/Trash
export MY_VIDEO=$HOME/Video
export MY_WT=$HOME/.config/note

export CARGO_TARGET_DIR="/tmp/cargo/target"
export RUSTC_WRAPPER=/usr/bin/sccache
export RUSTFLAGS="-C link-arg=-fuse-ld=lld -A dead_code"
export SCCACHE_CACHE_SIZE="1G"
export SCCACHE_DIR="/tmp/cargo/sccache"

export QTWEBENGINE_DISABLE_SANDBOX=1
export TESSDATA_PREFIX=/usr/share/tessdata

export CARGO_NAME="TK4E"
export CARGO_EMAIL="tk4ecc@gmail.com"
export LESSHISTFILE=-

export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/config.toml
eval "$(zoxide init zsh)"
#===============================================================================
# 加载函数
# autoload -U zmv

zstyle ':completion:*' rehash true
setopt no_nomatch
setopt HIST_IGNORE_DUPS
#===============================================================================
#bindkey
    # 查看按键绑定

# 功能键
#===============================================================================
# 自动补全
# 扩展路径
    # /v/c/p/p => /var/cache/pacman/pkg
setopt complete_in_word

# 将以下字符视为单词的一部分
export WORDCHARS='*?_[]~=&;!#$%^(){}<>'

setopt AUTO_LIST
setopt AUTO_MENU

# 路径补全
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'
zstyle ':completion::complete:*' '\\'

# 修正大小写
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# 错误校正
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:match:*' original only

# 补全类型提示分组
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'
#-------------------------------------------------------------------------------
# 关于历史纪录的配置
export HISTFILE=$XDG_CACHE_HOME/zsh/.zsh_history
    # 历史纪录文件
export HISTSIZE=2000
    # 历史纪录条目数量
export SAVEHIST=2000
    # 注销后保存的历史纪录条目数量
export KEYTIMEOUT=1
    # 修改 esc 超时时间为 0.01s


setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
#-------------------------------------------------------------------------------
# man 颜色
#export LESS_TERMCAP_mb=$'\E[01;31m'
#export LESS_TERMCAP_md=$'\E[01;32m'
#export LESS_TERMCAP_me=$'\E[0m'
#export LESS_TERMCAP_se=$'\E[0m'
#export LESS_TERMCAP_so=$'\E[01;44;33m'
#export LESS_TERMCAP_ue=$'\E[0m'
#export LESS_TERMCAP_us=$'\E[04;36;4m'
#===============================================================================
alias a2='proxychains4 -q aria2c -c -x 8 -s 8 -j 5'
#alias aplay='asciinema play'
#alias arec='asciinema rec'
#alias auz='ark -ab $1 -o /dev/shm'
#alias c='a(){ cd $1 && l ;};a $1'
#alias cpp_opencv='a(){cpp $(pkg-config opencv4 --cflags --libs) -o $1 $1.cpp ;};a $1'
#alias dff='a(){ diff -u $1 $2 | delta ;};a $1 $2'
#alias eadd='\ark -t'
#alias exfd='tar -xf archive.tar --wildcards '*.js''
#alias exrm='tar --delete -f'
#alias gck='a(){ gcc -std=c17 -o $1 $1.c ;};a $1'
#alias gclear='git clean -df'
#alias gpull='git -pull'
#alias gw='gwenview'
#alias jk='\clear && \ls -sh --color'
#alias medi='mediainfo'
#alias mfx='/usr/bin/firefox-developer-edition --profile /root/.local/share/firefox/.mozilla/firefox/v9r7tl44.dev-edition-default-1599269602864 &> "/dev/null" &'
#alias mosh_ssh='mosh --ssh="ssh -p 7777" u0_a507@192.168.0.101'
#alias music='mpd && ncmpcpp'
#alias paepub='a(){ pandoc +RTS -M100m -RTS $1 -o $1.epub ;}; a $1'
#alias pcmss='paru -s'
#alias pwg='proxychains4 -q wget -c'
#alias rekde='kquitapp5 plasmashell && nohup kstart5 plasmashell &> "/dev/null" &'
#alias ssdb='smartctl -i -n standby /dev/sdb'
#alias tail_log='tail -f $1 | bat --paging=never -l log'
#alias unsub='a(){ udisksctl unmount -b $1 && udisksctl power-off -b $1 ;};a $1'
#alias unsubp='a(){ udisksctl power-off -b $1 ;};a $1'
#alias vc='cvlc'
#alias vcut='vidcutter'
#alias vmm='mpv image-display-duration=inf'
#alias winecfg='LC_ALL=zh_CN.UTF-8 winecfg'
#alias yac='YACReader'
#alias ytsub='proxychains4 -q youtube-dl --skip-download --write-auto-sub --sub-format str --sub-lang en,ja,zh'
#alias zein='zerotier-cli join'
#alias zels='zerotier-cli listnetworks'
#alias zeon='zerotier-one -d'
#alias zeou='zerotier-cli leave'
#alias zest='zerotier-cli status'
#cat /proc/net/dev
#journalctl --vacuum-size=10M
#rustup component add
#rustup component remove
#rustup toolchain add
#rustup toolchain remove
#rustup component remove --toolchain nightly --target x86_64-unknown-linux-gnu rustfmt
#vnstat -l
alias ikemen='MESA_GL_VERSION_OVERRIDE=4.4 MESA_GLSL_VERSION_OVERRIDE=440 ~/Game/Ikemen/Ikemen_GO_Linux &> /dev/null 2>&1 &'
alias .='pwd'
alias ..='cd ../ && l'
alias ...='cd ../.. && l'
alias ....='cd ../../.. && l'
alias .....='cd ../../../.. && l'
alias 444='chmod 444'
alias 600='chmod 600'
alias 700='chmod 700'
alias 755='chmod 755'
alias 775='chmod 775'
alias 777='chmod 777'   # r=4 w=2 x=1
alias cargo_rmc='cargo cache --remove-dir git-repos,registry-sources --dry-run'
alias cargo_rmcc='cargo cache --remove-dir git-repos,registry-sources'
alias cg='cargo'
alias day='curl wttr.in/foshan && cal && \date'
alias date='date "+%Y-%m-%d"'
alias mkdate='mkdir `\date "+%Y-%m-%d"`'
alias diff='diff -y'
alias docker-compose='podman-compose'
alias docker='podman'
alias exhentai_01='hentai-downloader -u $1 -c ~/.config/exhentai/5090839'
alias cutimg='mkdir /tmp/cutimg; import "/tmp/cutimg/`\date '+%Y-%m-%d_%H:%M:%S'`.png"'
alias exif='identify -verbose'
alias ff='time ffmpeg -hide_banner -i'
alias ffmedi='ffprobe -v debug -pretty -show_error -show_format -show_streams -show_programs -show_data -bitexact -show_private_data'
alias ffsvg='plotframes -i $1 -o $1.svg -t svg'
alias frp='frpc -c "/root/.config/frp/frpc.ini"'
alias fx='firefox-developer-edition'
alias ipp='bandwhich -n'
alias job='jobs -l'
alias ka='killall'
alias web_miniserve='\miniserve -t 'TK4E' -r -g -u -o -p -D 56001 . &> /dev/null 2>&1 &'
alias kawin32='WINEARCH=win32 WINEPREFIX=$XDG_DATA_HOME/win32 wineserver -k'
alias kawin='wineserver -k'
alias l='exa -aF --color-scale'
alias la='exa -bila@ghHSF --git --time-style=long-iso --group-directories-first'
alias laa='exa -bila@ghHSF --git * --time-style=long-iso --group-directories-first'
alias mand='scrcpy -s 192.168.2.3 --window-borderless -b2M -m800 --shortcut-mod=rctrl --disable-screensaver --turn-screen-off --prefer-text &> "/dev/null" &'
alias mk='mkdir -p'
alias gdl='proxychains4 -q gdl -o ~/.config/gdl.conf -c ~/.config/gdl.conf -p 4'
alias rustfmt='fd --type f --glob '*.rs' ./ -x ~/.local/bin/rs/rustfmt {}'
alias ssh='HOME=$XDG_CONFIG_HOME/ssh \ssh'
# alias mpicard='\picard &> "/dev/null" &'
alias mqb='qbittorrent $1 &> "/dev/null" 2>&1 &'
alias msdb='mount /dev/sdb3 /.disk/hddb2'
alias msqb='sqlitebrowser $1 &> "/dev/null" 2>&1 &'
alias krita='\krita &> /dev/null 2>&1 &'
alias mtg='proxychains4 -q telegram-desktop &> "/dev/null" 2>&1 &'
alias mtr='transmission-remote'
alias mtra='transmission-remote -a'
alias mtrl='transmission-remote -t 3 -f'
alias n='nvim -n'
# alias wiki='nvim 0.md -c :WikiIndex'
alias himalaya='proxychains4 -q nvim -c :Himalaya'
alias n_colab='nvim $MY_WT/colab.sh'
alias n_ff='nvim $MY_WT/ffmpeg.md'
alias st='shutdown -h 0'
alias n_my='nvim $MY_WT/note.md'
alias n_vim='cd ~/.config/nvim/lua ; ls'
alias w3m='HOME=/tmp/w3m \w3m'
alias adb='HOME=/root/.config/android \adb'
alias pw3m='HOME=/tmp/w3m \proxychains4 -q \w3m'
alias parallel='HOME=/tmp/parallel \parallel'
alias n_zsh='nvim $XDG_CONFIG_HOME/zsh/.zshrc'
alias nd='ncdu --color dark'
alias ndiff='nvim -d'
alias pcm='pacman -Sy'
alias pcmclear='paccache -ruk0 && paccache -rk 2 && pacman -Rsn $(pacman -Qtdq)'
alias pcmfy='pacman -Fy'
alias pcmr='pacman -Rsn'
alias pcmrdd='pacman -Rdd'
alias pcmrsc='pacman -Rsc'
alias pcmrscn='pacman -Rscn'
alias pcmsi='pacman -Si'
alias pcmss='pacman -Ss'
alias pcmsyu='pacman -Syu > /tmp/pacman-pcup.txt && bash $HOME/.local/bin/sh/bck.sh'
alias px='proxychains4 -q'
alias py2='python2'
alias py3='python3'
alias rm='mv -it $MY_TRASH'
alias rp='rsync -az --stats'
alias rpde='rsync -avzP --delete'
alias rpq='rsync -azq'
alias sys='systemctl'
alias sysoff='systemctl stop'
alias syson='systemctl start'
alias sysre='systemctl restart'
alias t='trans -4 -x 127.0.0.1:8889 :zh'
alias tez='trans -4 -x 127.0.0.1:8889 :en+zh'
alias tjz='trans -4 -x 127.0.0.1:8889 :ja+zh'
alias tpt='my_pwd=$PWD; \cd /tmp && powder-toy &> /dev/null &; cd $my_pwd'
alias tree='exa -TFL'
alias tsh='trans -4 -x 127.0.0.1:8889 -p -shell :zh'
alias tt='taskwarrior-tui'
alias tze='trans -4 -x 127.0.0.1:8889 :zh+en'
alias tzj='trans -4 -x 127.0.0.1:8889 :zh+ja'
alias vi='\nvim -i NONE'
alias vmpl='mpv --playlist=/tmp/mpv/x &> /dev/null 2>&1 &'
#alias web_chfs='$HOME/.local/bin/chfs/chfs --file=$HOME/.local/bin/chfs/chfs.ini &> /dev/null 2>&1 &'
alias web_ipfs='tar -xvf ~/.local/share/ipfs.tar.zst -C /tmp && ipfs daemon --enable-gc --routing=dhtclient &> /dev/null 2>&1 &'
alias ka_ipfs='tar -acf ~/.local/share/ipfs.tar.zst -C /tmp ipfs && ipfs repo gc && killall ipfs'
alias wget='\wget -c'
alias wjp='LANG=ja_JP.UTF-8 wine'
alias xorg='startx ~/.config/X11/xinitrc -- -keeptty &> /tmp/xorg.log'
alias za='zathura'
alias zipall='for f in * ;do zip -q -r "$f.zip" $f; done'
alias zshrc='source ~/.config/zsh/.zshrc'
alias kmon='\kmon -a #999999 -c #555555'
alias viu='COLORTERM=truecolor \viu'
alias gpg-tui='\gpg-tui --style colored'

#===============================================================================
b () {
    case $1 {
    (*.tar | *.tar.gz | *.tar.zst | *.zst)
        tar -tf $1 | head -10;;
    (*)
        bat --color always --wrap never --pager never --line-range :20 -p $1 ;;
    }
}
#-------------------------
gg () {
    HOME=/tmp \rpg $@
    cd $@
}
#-------------------------
c() {
    \cd $1 && l
}


#-------------------------
gpgc () {
    \gpg -c --batch --passphrase $1
}

#-------------------------
gpgd () {
    psw=$1
    file=$2
    \gpg -d --batch --passphrase $psw $file > ${file%.*}
}

#-------------------------
#gck() {
#    \gcc -std=c17 -o $1 $1.c
#}
#-------------------------
dff() {
    \diff -u $1 $2 | delta
}
#-------------------------
noh() {
    \nohup $1 2>&1 &> "/dev/null" &
}
#-------------------------
# dxvk:  WINEPREFIX=~/.wine setup_dxvk install
# glxinfo | grep "OpenGL"
wdjp() {
    MESA_GL_VERSION_OVERRIDE=4.4 MESA_GLSL_VERSION_OVERRIDE=440 \
        WINEDLLOVERRIDES="d3d9,dxgi=b" LANG=ja_JP.UTF-8 \
        \wine $1 -force-d3d9
}


#-------------------------
wdxvk() {
    WINEPREFIX=~/.local/share/windxvk wine $1
}
#-------------------------
wdjpp() {
    MESA_GL_VERSION_OVERRIDE=4.4 MESA_GLSL_VERSION_OVERRIDE=440 \
        WINEDLLOVERRIDES="d3d11,dxgi=b" LANG=ja_JP.UTF-8 \
        \wine $1 -force-d3d9
}
#-------------------------
win32() {
    WINEARCH=win32 WINEPREFIX=$XDG_DATA_HOME/win32 \
        \wine $1 -force-d3d9
}
#-------------------------
wd32() {
    MESA_GL_VERSION_OVERRIDE=4.4 MESA_GLSL_VERSION_OVERRIDE=440 \
        WINEDLLOVERRIDES="d3d9,dxgi=b" WINEARCH=win32 WINEPREFIX=$XDG_DATA_HOME/win32 \
        \wine $1 -force-d3d9
}
#-------------------------
rmt() {
    p=$PWD
    killall rclone; \rm -rf /dev/shm/0
    mkdir /dev/shm/0
    cd $p
}
#-------------------------
pa() {
    p=$PWD
    cd /tmp
    paru --getpkgbuild $1 && cd $1
    proxychains4 -q makepkg -si
    cd $p
}
#-------------------------
pand() {
    while {getopts 'w:f' arg} {
        case $arg {
            (w)
                pandoc -f mediawiki -t html5 -s $2 -o $2.html

        }
}


}
#-------------------------
2svg() {
    \ffmpeg -i $1 "$1.bmp" && potrace -s "$1.bmp"
}
#-------------------------
vpy() {
    \vspipe --y4m $1.vpy - | mpv -
}
#-------------------------
pcmtree() {
    \pactree $1 | nvim -
}
#-------------------------
pcmls() {
    \pacman -Qlq $1 | grep /usr/bin
}

#-------------------------
ae() {
    aseprite $1 &> "/dev/null" 2>&1 &
}
#-------------------------
exl() {
    \tar -tf $1 | rg /
}
#-------------------------
tzst() {
    if (($+2)) {  # 判断 $2 是否存在
        P="$2/$1"
    } else {
        P="./$1"
    }
    ZSTD_CLEVEL=15 \
        \tar -acf $P.tar.zst $1
}
#-------------------------
torz() {
    \tar -acf - $1 | \orz encode -l2 > $2/$1.tar.orz
}
#-------------------------
ttar() {
    \tar -acf $1.tar $1
}
#-------------------------
exf() {
    \tar -xf $2 --strip-components $1 -C $4 $3
}
#-------------------------
tgup () {
    case $1 {
        (game)
            proxychains4 -q telegram-upload -d --directories recursive -f 'https://t.me/joinchat/Dho-DMZK7PbQayFf' $2 &> /dev/null ;;
        (me)
            proxychains4 -q telegram-upload --directories recursive -f me $2 ;;
        (anime)
            proxychains4 -q telegram-upload --directories recursive -f 'https://t.me/joinchat/GFX-BhZp6LWGhJs2' $2 &> /dev/null  ;;
        (manga)
            proxychains4 -q telegram-upload --directories recursive -f 'https://t.me/joinchat/IBtWM91oZGErtxRh' $2 &> /dev/null  ;;
        (video)
            proxychains4 -q telegram-upload --directories recursive -f 'https://t.me/joinchat/VNLzHupe0h08tfg8' $2 &> /dev/null  ;;
        (music)
            proxychains4 -q telegram-upload --directories recursive -f 'https://t.me/joinchat/GUZu4EafwVyX35mL' $2 &> /dev/null  ;;
    }
}


#-------------------------
exorz() {
    orz decode $1 | tar -xvf -
}
#-------------------------
vm() {
    if  [ ! $1 ]; then
        \mpv "./" &> "/dev/null" 2>&1 &
    else
        \mpv $1 &> "/dev/null" 2>&1 &
    fi
}
#-------------------------
music() {
    \nohup \mpv --shuffle ~/Music &> "/dev/null" 2>&1 &
}
#-------------------------
krcl () {
    \fusermount -qzu /dev/shm/$1 && \rm -rf /dev/shm/$1
}
#-------------------------
vmp() {
    if  [ ! $1 ] ;then
        \mpv --pause "./" &> "/dev/null" 2>&1 &
    else
        \mpv --pause $1 &> "/dev/null" 2>&1 &
    fi
}
#-------------------------
vf() {
    if  [ ! $1 ] ;then
        \vfdir
    else
        \vfdir $1
    fi
}
#-------------------------
media() {
    \mediainfo --Inform="General;Duration=%Duration/String3%\nFile size=%FileSize/String1%" $1
    #\mediainfo --Inform="Video;Resolution=%Width%x%Height%\nCodec=%CodecID%" $1
}
# mediainfo --info-parameters | less
#-------------------------
# exmanga() {
# AG=25; auz *zip && \
# find ~/t/* | parallel --load 80% \
# ffmpeg -i {} -q:v $AG -loglevel error -stats {.}_%d.jpeg; \
# \rm -rf ~/t/*/(*\.jpg|*\.png|*\.webp) && \
# for f in ~/t/*; do zip -q -r "$f".cbz "$f"; \
# \rm -rf "$f"; done && \
# \rm ./*zip; \
# mv ~/t/*cbz ./; l;cd ..
# }
#-------------------------
# copy file from RAM
procdump() {
    cat /proc/$1/maps | grep -Fv ".so" | grep " 0 " | awk '{print $1}' | \
        ( IFS="-"
            while read a b; \
            do dd if=/proc/$1/mem bs=$( getconf PAGESIZE ) iflag=skip_bytes,count_bytes \
                skip=$(( 0x$a )) count=$(( 0x$b - 0x$a )) of="$1_mem_$a.bin"
                        done )
}
#-------------------------
#===============================================================================
# curl https://bashupload.com/ --data-binary @

# px curl https://sh.rustup.rs -sSf | sh -s -- -y --profile minimal --default-toolchain "nightly"
#===============================================================================
#-------------------------
#emm () {
#    mkdir $MY_EH/$1
#    mv *$1*.cbz $MY_EH/$1/
#}
#-------------------------
em () {
    mkdir $1
    mv *$1*.cbz $1
}
#-------------------------
ev () {
    mkdir $MY_VIDEO/ht/$1
    mv *$1*  $MY_VIDEO/ht/$1
}

# mv (*\.jpg|*\.png|*\.webp|*\.jpeg)
#-------------------------
#mkv () {
#    mkdir "./$1";
#    mv *$1* $1
#}
#-------------------------
#zzmv () {
#  zmv './(*)/(*).(*)' './$1/$1.$3'
#}
#-------------------------
rmrf () {
    exa -ila@ghHSF "$MY_TRASH" &&\
    exa -ila@ghHSF "$MY_TRASH" >> "$XDG_CONFIG_HOME"/Disk/Trash.log &&\
        \rm -rI "$MY_TRASH"/(.*|*)
}
#-------------------------
cbz () {
    for f in *;do zip -q -r "$f".cbz "$f" && \rm -rf "$f"; done
}
#-------------------------
rmncbz () {
    IFS=$(echo -en "\n\b") && \rm -r `ls | grep -v "\.cbz"` && IFS=" "
}
#-------------------------
#rrm () {
#    if  [ -d "/tmp/0" ] ;then
#        rsync -a --delete /tmp/0/ $1/
#    else
#        mkdir "/tmp/0" && rsync -a --delete /tmp/0/ $1/
#    fi
#}
#-------------------------
#gitdiff() {
#    git diff --name-only --diff-filter=d | xargs bat --diff
#}
#-------------------------
freeswap () {
    sync
    echo 1 > /proc/sys/vm/drop_caches
    swapoff -a
    swapon -a
    free -h
}
#-------------------------
freemem () {
    # sync && echo 1 > /proc/sys/vm/drop_caches
    # sync && echo 2 > /proc/sys/vm/drop_caches
    sync && echo 3 > /proc/sys/vm/drop_caches

    free -h
}
#-------------------------
#-------------------------
rclw () {
    local drive=$1 patch=$2
    mkdir -p $MY_SHM/$drive ; \
        rclone mount $drive:$patch $MY_SHM/$drive \
        --allow-non-empty \
        --allow-other \
        --buffer-size 12M \
        --cache-dir /tmp/rclon \
        --low-level-retries 20 \
        --transfers 4 \
        --user-agent "Mozilla" \
        --vfs-cache-max-age 0h0m1s \
        --vfs-cache-max-size 100M \
        --vfs-cache-mode full \
        --vfs-cache-poll-interval 0m1s \
        --daemon
}
#-------------------------
utf8() {
    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")
    mkdir v2; for f in *\.$1; do iconv -c -f $2 -t utf-8 $f > ./v2/"${f%.*}.$1"; done
    IFS=$SAVEIFS
}
#convmv -f GBK -t UTF-8 --notest --nosmart file
#-------------------------
proxy_of() {
    unset http_proxy
    unset https_proxy
    unset socks5_proxy
    echo -e "已关闭代理"
}
#-------------------------
proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    export http_proxy="127.0.0.1:8889"    #此处改为自己的http代理端口
    export https_proxy=$http_proxy
    export socks5_proxy="127.0.0.1:1089"  #此处改为自己的socks代理端口
    echo -e "已开启代理"
}
#-------------------------
my_ip() {
    \curl api.ipify.org
}
#-------------------------
# Archlive
alias ex='extract'

# 7z e xx.7z -o./xx
# for f in *.zip; do unzip -d "${f%*.zip}" "$f"; done
#-------------------------
ffimg() {
    while {getopts 'a:b' arg} {
        case $arg {
            (a)
                fd . -t f | parallel --load 99 --retries 3 \
                    ffmpeg -i {} -q:v $2 -y ./{.}.jpeg \
                    &> /dev/null && \rm -f ./(*\.jpg|*\.png|*\.webp)
                                    ;;

            (b)
                find */* -type f -print0 | parallel -0 --load 99 --retries 3 \
                    ffmpeg -i {} -q:v $2 -loglevel error -stats -y {.}.jpeg \
                    &> /dev/null && \rm -f ./*/(*\.jpg|*\.png|*\.webp)
                                    ;;

        }
}
}

# mkdir '#' && fd */* --type f --max-depth 1 | rush 'ffmpeg -i {} -q:v 24 {.}.jpg && mv {} '#/' &> /dev/null && \rm -rf '#' &
#-------------------------
ffm3u8() {
    proxychains4 -q ffmpeg -y -loglevel verbose -i $1 -c copy `\date "+%Y-%m-%d"`.ts
}
#-------------------------
ffmusic () {
    while {getopts 'a' arg} {
        case $arg {
            (a)
                fd flac . -x ffmpeg -i {} -c:a libopus -b:a 96k {.}.opus
                ;;

            (f)
                fd flac . -x ffmpeg -i {} -c:a libopus -b:a 96k {.}.opus && \rm *flac */*flac
                ;;
            }
    }

    # -b:a [ 64k | 96k | 128k | 160k | 192k | 224k | 256k | 320k]
    # -c:a [ libopus | ac3 | mp3 | aac ]

}
#===============================================================================
if [[ ! -f $XDG_DATA_HOME/zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$XDG_DATA_HOME/zinit" && command chmod g-rwX "$XDG_CACHE_HOME/zinit"
    command git clone https://github.com/zdharma/zinit "$XDG_DATA_HOME/zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$XDG_DATA_HOME/zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
#-------------------------
declare -A ZINIT
ZINIT[BIN_DIR]=$XDG_DATA_HOME/zinit/bin
ZINIT[COMPLETIONS_DIR]=$XDG_DATA_HOME/zinit/completions
ZINIT[HOME_DIR]=$XDG_DATA_HOME/zinit
ZINIT[PLUGINS_DIR]=$XDG_DATA_HOME/zinit/plugins
ZINIT[SNIPPETS_DIR]=$XDG_DATA_HOME/zinit/snippets
ZINIT[ZCOMPDUMP_PATH]=$XDG_DATA_HOME/zcompdump/zcompdump-zinit

#proxy_on && zinit update --all
#=========================================================================
#-------------------------
# 加载 OMZ 框架及部分插件
zinit snippet OMZ::lib/completion.zsh
# zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
#-------------------------
# 快速目录跳转
# zinit ice lucid wait='3'
# zinit light skywind3000/z.lua
#-------------------------
# fzf + git
# zinit ice lucid wait='3'
# zinit load wfxr/forgit
#-------------------------
# 彩色 ls
zinit ice lucid wait='1'
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS
#-------------------------
# fzf-tab
zinit ice lucid wait='2'
zinit light Aloxaf/fzf-tab
#-------------------------
zinit ice lucid wait='2'
zinit light hlissner/zsh-autopair
#-------------------------
# highlight
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
#-------------------------
#ZSH_THEME="gruvbox"
#SOLARIZED_THEME="dark"
#zpl snippet '$ZDOTDIR/plug/theme/agnoster.zsh'
zpl snippet '$ZDOTDIR/plug/theme/gruvbox.zsh'
zpl snippet '$ZDOTDIR/plug/extract/extract.zsh'
#===============================================================================
#-------------------------
# FZF
#export FZF_DEFAULT_COMMAND='rg --files --line-number --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:/' continuous-trigger '/'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'exa -F -1 --color=always $realpath'
#-------------------------
# zsh-autopair
AUTOPAIR_LBOUNDS+=("'" "'")
AUTOPAIR_LBOUNDS+=('"' '"')
AUTOPAIR_LBOUNDS+=('`' '`')
AUTOPAIR_LBOUNDS+=(braces '')
AUTOPAIR_LBOUNDS+=(quotes '[]})a-zA-Z0-9]')
AUTOPAIR_LBOUNDS+=(spaces '[^{([]')
AUTOPAIR_LBOUNDS=(all '[.:/\!]')
AUTOPAIR_PAIRS+=("<" ">")
AUTOPAIR_RBOUNDS+=(braces '')
AUTOPAIR_RBOUNDS+=(quotes '[a-zA-Z0-9]')
AUTOPAIR_RBOUNDS+=(spaces '[^]})]')
AUTOPAIR_RBOUNDS=(all '[[{(<,.:?/%$!a-zA-Z0-9]')
typeset -gA AUTOPAIR_PAIRS
#-------------------------
# # forgit
# FORGIT_STASH_FZF_OPTS='
# --bind="ctrl-d:reload(git stash drop $(cut -d: -f1 <<<{}) 1>/dev/null && git stash list)"
# '
#
# FORGIT_LOG_FZF_OPTS='
# --bind="ctrl-e:execute(echo {} |grep -Eo [a-f0-9]+ |head -1 |xargs git show |vim -)"
# '
#
#
# FORGIT_DIFF_PAGER=delta
# FORGIT_PAGER=bat
# forgit_add=gfad
# forgit_checkout_branch=gfcb
# forgit_checkout_file=gfch
# forgit_cherry_pick=gfcp
# forgit_clean=gfclean
# forgit_diff=gfdf
# forgit_ignore=gfig
# forgit_log=gflo
# forgit_rebase=gfrb
# forgit_reset_head=gfrh
# forgit_stash_show=gfss
# FORGIT_COPY_CMD='xclip -selection clipboard'
#-------------------------


#===============================================================================
# CTRL+A              # 移动到行首  同 <Home>
# CTRL+B              # 向后移动  同 <Left>
# CTRL+C              # 结束当前命令
# CTRL+D              # 删除光标前的字符  同 <Delete>  或者没有内容时退出会话
# CTRL+E              # 移动到行末  同 <End>
# CTRL+F              # 向前移动  同 <Right>
# CTRL+G              # 退出当前编辑(比如正在 CTRL+R 搜索历史时)
# CTRL+H              # 删除光标左边的字符  同 <Backspace>
# CTRL+K              # 删除光标位置到行末的内容
# CTRL+L              # 清屏并重新显示
# CTRL+N              # 移动到命令历史的下一行  同 <Down>
# CTRL+O              # 类似回车  但是会显示下一行历史
# CTRL+P              # 移动到命令历史的上一行  同 <Up>
# CTRL+R              # 历史命令反向搜索  使用 CTRL+G 退出搜索
# CTRL+S              # 历史命令正向搜索  使用 CTRL+G 退出搜索
# CTRL+T              # 交换前后两个字符
# CTRL+U              # 删除字符到行首
# CTRL+V              # 输入字符字面量  先按 CTRL+V 再按任意键
# CTRL+W              # 删除光标左边的一个单词
# CTRL+X              # 列出可能的补全
# CTRL+Y              # 粘贴前面 CTRL+u/k/w 删除过的内容
# CTRL+Z              # 暂停前台进程返回 bash，需要时可用 fg 将其切换回前台
# CTRL+_              # 撤销(undo)   有的终端将 CTRL+_ 映射为 CTRL+/ 或 CTRL+7
# CTRL+X CTRL+X       # 连续按两次 CTRL+X  光标在当前位置和行首来回跳转
# CTRL+X CTRL+E       # 用你指定的编辑器  编辑当前命令
# CTRl + RIGHT        # 按单词向前移动
# CTRl + LEFT         # 按单词向后移动
# ALT+b               # 向后(左边) 移动一个单词
# ALT+d               # 删除光标后(右边) 一个单词
# ALT+f               # 向前(右边) 移动一个单词
# ALT+t               # 交换字符
# ALT+BACKSPACE       # 删除光标前面一个单词  类似 CTRL+W  但不影响剪贴板


# !l                  # 运行以 l 开头的最后一条命令
# !l:p                # 打印以 l 开头的最后一条命令
# !$                  # 前一个命令的最后一个参数
# !*                  # 前一个命令的所有参数
# ^l^a                # 运行先前的命令  将 l 替换为 a
# !:-                 # 去掉最后一个参数执行上一个命令
# !^                  # 使用上条命令第一个参数
# $$                  # Shell 本身的 PID(ProcessID)
                        # 这个变量经常用来构造一个 unique 的临时文件名  通常比调用 mktemp 来得简单
# $!                  # Shell 最后运行的后台 Process 的 PID
# $?                  # 最后运行的命令的结束代码(返回值)
# $-                  # 使用 Set 命令设定的 Flag 一览
# $*                  # 所有参数列表
                        # 如 "\(*" 用 "" 括起来的情况
                        # 以"\)1 \(2 … \)n"的形式输出所有参数
                        # 所有的位置参数,被作为一个单词，注意:"$*"必须被""引用
# $@                  # 与$*同义,但是每个参数都是一个独立的""引用字串
                        # 这就意味着参数被完整地传递,并没有被解释和扩展
                        # 这也意味着  每个参数列表中的每个参数都被当成一个独立的单词
                        # 注意 $@ 必须被 "" 引用
# $#                  # 添加到 Shell 的参数个数
# $0                  # Shell 本身的文件名
# $n                  # 添加到Shell的各参数值
                        # n 为数字 1-9 只能表示前9个参数
                        # 使用shift命令可以改变这个限制
# $_                  # 保存之前执行的命令的最后一个参数
# $0                  # 当前脚本的文件名
# $n(n≥1)             # 传递给脚本或函数的参数
                        # n 是一个数字  表示第几个参数
                        # 例如  第一个参数是 $1  第二个参数是 $2
# $#                  # 传递给脚本或函数的参数个数
# $*                  # 传递给脚本或函数的所有参数
# $@                  # 传递给脚本或函数的所有参数
                        # 当被双引号" "包含时，$@ 与 $* 稍有不同
# $?                  # 上个命令的退出状态，或函数的返回值
# $$                  # 当前 Shell 进程 ID
                        # 对于 Shell 脚本  就是这些脚本所在的进程 ID




#===============================================================================


#eval "$(starship init zsh)"
