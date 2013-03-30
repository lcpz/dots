#
# ~/.bashrc
#

[[ $- != *i* ]] && return
[ -n "$WINDOWID" ] && transset-df -i $WINDOWID >/dev/null
[ -n "$TMUX" ] && export TERM=rxvt-unicode-256color
[ -z "$PS1" ] && return

_PROMPT() {
  _EXIT_STATUS=$?
  [ $_EXIT_STATUS != 0 ] && _EXIT_STATUS_STR="\[\033[1;30m\][\[\033[1;31m\]$_EXIT_STATUS\[\033[1;30m\]] "
  PS1="\033[1;30m\]» \[\e[1;33m\]\u\033[1;30m\] $_EXIT_STATUS_STR\[\033[1;30m\][\[\033[0m\]\W\[\033[1;30m\]]\[\033[1;30m\]:\[\033[0m\] "
  unset _EXIT_STATUS_STR
}
                
PROMPT_COMMAND=_PROMPT

alias ls='ls -h --color=auto'
alias lano='nano -AiWDucd'
alias slano='sudo nano -AiWDucd'
alias v='vim'
alias m='mutt'
alias sv='sudo vim'
alias pacman='sudo pacman-color'
alias pac='pacman-color'
alias pacs='sudo pacman-color -S'
alias pacr='sudo pacman-color -Rscudn'
alias upmirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup; sudo reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias win='sudo ntfs-3g /dev/sda2 /media/win; cd /media/win/Users/luke/Desktop'
alias upterm='xrdb $HOME/.Xdefaults'
alias awrc='$EDITOR $HOME/.config/awesome/rc.lua'
alias awtheme='$EDITOR $HOME/.config/awesome/themes/blackburn/theme.lua'
alias awdir='cd $HOME/.config/awesome'
alias tmux='tmux -2uv'
alias links='links -anonymous'
alias copysel='xsel -p -o | xsel -i -b'
alias usb='sudo mount -t vfat /dev/sdb1 /media/usbstick; cd /media/usbstick'
alias usb2='sudo mount -t vfat /dev/sdb /media/usbstick; cd /media/usbstick'
alias storage='sudo ntfs-3g /dev/sda3 /media/storage; cd /media/storage'
alias win='sudo ntfs-3g /dev/sda2 /media/win; cd /media/win/Users/luke/Desktop'
alias clean='find $HOME -name "\!*~*" -exec trash {} +; find $HOME -name "tmux-*.log" -exec trash {} +; find $HOME -name "*.class" -exec trash {} +; find $HOME -name ".*.swp" -exec trash {} +'
alias showtrash='cd ~/.local/share/Trash; ranger'
alias emptytrash='sudo rm -r ~/.local/share/Trash; mkdir ~/.local/share/Trash'
alias ve='vim -u ~/.vimencrypt -x'
alias ps='ps -AlFH'
alias pdflatex='rubber -d; pdflatex'
alias copyrc='cp $HOME/.config/awesome/rc.lua $HOME/.config/awesome/rc.lua.save'
alias awerr='if test -s ~/.cache/awesome/stderr; then more ~/.cache/awesome/stderr; else echo "Awesome WM: nessun errore riportato"; fi'
alias rehome='sudo netcfg -r wlan-home'
alias reboot='sudo reboot'
alias systemctl='sudo systemctl'
alias findname='sudo find / -name'
alias clearcache='echo "sync; echo 3 > /proc/sys/vm/drop_caches"'
alias homepage='cd $HOME/.homepage; rm *; homepage; cd'
alias wifi='sudo wifi-menu'
alias commands='more $HOME/.bashrc | grep alias* | cut -d" " -f2- -s'

export EDITOR="vim"
export PATH=$PATH:~/bin
export R600_ENABLE_S3TC=1
export GREP_COLOR="1;31"
export LESS="-R"
export LANG=it_IT.utf8
eval $(dircolors -b $HOME/.config/dir_colours)

