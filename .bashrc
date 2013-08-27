#
# ~/.bashrc
#

[[ $- != *i* ]] && return
[[ -d $HOME/bin ]] && export PATH=$PATH:$HOME/bin
[[ -d /usr/bin/vendor_perl ]] && export PATH=$PATH:/usr/bin/vendor_perl
[ -n "$WINDOWID" ] && transset-df -i $WINDOWID >/dev/null
[ -n "$TMUX" ] && export TERM=rxvt-unicode-256color
[ -z "$PS1" ] && return

_PROMPT() {
  _EXIT_STATUS=$?
  [ $_EXIT_STATUS != 0 ] && _EXIT_STATUS_STR="\[\033[1;30m\][\[\033[1;31m\]$_EXIT_STATUS\[\033[1;30m\]] "
  PS1="\033[1;30m\]» \[\e[0;0m\]\u\033[1;30m\] $_EXIT_STATUS_STR\[\033[1;30m\][\[\033[0m\]\W\[\033[1;30m\]]\[\033[1;30m\]:\[\033[0m\] "
  unset _EXIT_STATUS_STR
}
                
PROMPT_COMMAND=_PROMPT

alias cower='cower -v'
alias ls='ls -h --color=auto'
alias ll='ls++'
alias lano='nano -AiWDucd'
alias slano='sudo nano -AiWDucd'
alias v='vim'
alias sv='sudo vim'
alias gv='gvim'
alias sgv='sudo gvim'
alias m='mutt'
alias z='zathura'
alias pacman='sudo pacman --color always'
alias pac='pacman --color always'
alias pacs='sudo pacman -S'
alias pacss='pacman -Ss'
alias pacsi='pacman -Si'
alias pacssi='pacman -Ssi'
alias pacqs='pacman -Qs'
alias pacqi='pacman -Qi'
alias pacqsi='pacman -Qsi'
alias pacr='sudo pacman -Rscudn'
alias upmirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup; sudo reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias win='sudo ntfs-3g /dev/sda2 /mnt/win; cd /mnt/win/Users/luke/Desktop'
alias upterm='xrdb $HOME/.Xresources'
alias awrc='$EDITOR $HOME/.config/awesome/rc.lua'
alias awtheme='$EDITOR $HOME/.config/awesome/themes/rainbow/theme.lua'
alias awdir='cd $HOME/.config/awesome'
alias tmux='tmux -2uv'
alias elinks='elinks -anonymous'
alias copysel='xsel -p -o | xsel -i -b'
alias usb='sudo mount -t vfat /dev/sdb1 /mnt/usb; cd /mnt/usb'
alias usb2='sudo mount -t vfat /dev/sdb /mnt/usb; cd /mnt/usb'
alias usbumount='sudo umount /mnt/usb'
alias cdrom='sudo mount -t iso9660 -o ro /dev/cdrom /mnt/cdrom; cd /mnt/cdrom'
alias storage='sudo ntfs-3g /dev/sda3 /mnt/storage; cd /mnt/storage'
alias win='sudo ntfs-3g /dev/sda2 /mnt/win; cd /mnt/win/Users/luke/Desktop'
alias clean='find $HOME -name "\!*~*" -exec trash {} +; find $HOME -name "*.log" -exec trash {} +; find $HOME -name "*.class" -exec trash {} +; find $HOME -name ".*.swp" -exec trash {} +'
alias showtrash='cd ~/.local/share/Trash; ranger'
alias emptytrash='sudo rm -r ~/.local/share/Trash; mkdir ~/.local/share/Trash'
alias ve='vim -u ~/.vimencrypt -x'
alias ps='ps -AlFH'
alias rublatex='rubber -d; pdflatex'
alias starthome='netctl start wlan-home'
alias rehome='netctl stop-all; sleep 2; netctl start wlan-home'
alias reboot='sudo reboot'
alias systemctl='sudo systemctl'
alias netctl='sudo netctl'
alias findname='sudo find / -name'
alias clearcache='echo "sync; echo 3 > /proc/sys/vm/drop_caches"'
alias homepage='cd $HOME/.homepage; rm *; homepage; cd'
alias wifi='sudo wifi-menu'
alias chat='weechat-curses'
alias eneassh='ssh -X antonio@192.168.14.140'
alias so="scrot ~/screenshots/tmp.png && imgurbash ~/screenshots/tmp.png; rm ~/screenshots/tmp.png"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias commands='more $HOME/.bashrc | grep alias* | cut -d" " -f2- -s'

complete -cf sudo
complete -cf man
complete -cf gv # gvim

set -o posix

export EDITOR="vim"
export GREP_COLOR="1;31"
export LESS="-R"
export MOZ_DISABLE_PANGO=1
export NOCOLOR_PIPE=1
export _JAVA_AWT_WM_NONREPARENTING=1
export LANG=it_IT.utf8

eval $(dircolors -b $HOME/.config/dir_colours)

extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
        *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
               c='bsdtar xvf';;
        *.7z)  c='7z x';;
        *.Z)   c='uncompress';;
        *.bz2) c='bunzip2';;
        *.exe) c='cabextract';;
        *.gz)  c='gunzip';;
        *.rar) c='unrar x';;
        *.xz)  c='unxz';;
        *.zip) c='unzip';;
        *)     echo "$0: unrecognized file extension: \`$i'" >&2
               continue;;
        esac

        command $c "$i"
        e=$?3
    done

    return $e
}
