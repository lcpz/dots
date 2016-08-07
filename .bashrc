[[ -d $HOME/bin ]] && export PATH=$PATH:$HOME/bin
[ -z "$PS1" ] && return

function __prompt_command() {
    local EXIT="$?"
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    if [ $EXIT != 0 ]; then
        PS1+=" ${Red}$EXIT"
    fi

    PS1+=" ${BBlu}\u${RCol}  \W  "
}

export PROMPT_COMMAND=__prompt_command

alias rm='rm -i'
alias l='ls -lh --color=always --group-directories-first --sort=size | coloredls'
alias ls='ls -h --color=auto'
alias v='vim'
alias sv='sudo vim'
#alias ve='vim -u ~/.vimencrypt -x'
alias m='mutt'
alias r='ranger'
alias z='zathura'
alias pacman='sudo pacman --color always'
alias pacs='sudo pacman --color always -S'
alias pacss='sudo pacman --color always -Ss'
alias pacqs='sudo pacman --color always -Qs'
alias pacqi='sudo pacman --color always -Qi'
alias pacr='sudo pacman --color always -Rscudn'
alias upmirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup; sudo reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias upterm='xrdb $HOME/.Xresources'
alias awrc='$EDITOR $HOME/.config/awesome/rc.lua'
alias awtheme='$EDITOR $HOME/.config/awesome/themes/copland/theme.lua'
alias awdir='cd $HOME/.config/awesome'
alias storage='sudo ntfs-3g /dev/sda4 /mnt/storage; cd /mnt/storage'
alias win='sudo ntfs-3g /dev/sda2 /mnt/win; cd /mnt/win/Users/Luke/Desktop'
alias showtrash='cd ~/.local/share/Trash; ranger'
alias emptytrash='sudo rm -r ~/.local/share/Trash; mkdir ~/.local/share/Trash'
alias reboot='sudo reboot'
alias cower='cower --color=always --target=$HOME/aur'
#alias clearcache='echo "sync; echo 3 > /proc/sys/vm/drop_caches"'
alias mpvw="mpv --aspect=16:9"
alias xc='xsel -p -o | xsel -i -b'
alias pp='pdflatex doc.tex; cpdf doc.pdf documento.pdf'
alias commands='more $HOME/.bashrc | grep alias* | cut -d" " -f2- -s'

complete -cf sudo

set -o posix

export EDITOR="vim"

export AWT_TOOLKIT="MToolkit"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dswing.aatext=true -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel" 

eval $(dircolors -b $HOME/.config/dir_colours)
