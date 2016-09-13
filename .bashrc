[ -z "$PS1" ] && return
[[ -d $HOME/bin ]] && export PATH=$PATH:$HOME/bin

function __prompt_command() {
    PS1=""
    local EXIT="$?"
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
alias m='mutt'
alias r='ranger'
alias z='zathura'
alias pacman='sudo pacman --color always'
alias pacs='sudo pacman --color always -S'
alias pacss='sudo pacman --color always -Ss'
alias pacqs='sudo pacman --color always -Qs'
alias pacqi='sudo pacman --color always -Qi'
alias pacr='sudo pacman --color always -Rscudn'
alias awrc='$EDITOR $HOME/.config/awesome/rc.lua'
alias awdir='cd $HOME/.config/awesome'
alias storage='sudo ntfs-3g /dev/sdb1 /mnt/storage; cd /mnt/storage'
alias win='sudo ntfs-3g /dev/sda2 /mnt/win; cd /mnt/win/Users/Luke/Desktop'
alias showtrash='ranger $HOME/.local/share/Trash'
alias emptytrash='sudo rm -r $HOME/.local/share/Trash; mkdir $HOME/.local/share/Trash'
alias reboot='sudo reboot'
alias cower='cower --color=always --target=$HOME/aur'
alias rip="sudo dhclient -r && sudo dhclient" 
alias mpvw="mpv --aspect=16:9"
alias xc='xsel | xsel -i -b'
alias xp='xsel -b | xsel'
alias pp='pdflatex doc.tex; cpdf doc.pdf documento.pdf'
alias commands='sed -n -e "0,/PROMPT/d" -e "s/alias //g" -e "s/=\x27/#/g" -e "/commands/d" -e "s/\x27//p" $HOME/.bashrc | column -t -s "#"'

complete -cf sudo

set -o posix

export EDITOR="vim"
export AWT_TOOLKIT="MToolkit"
export _JAVA_AWT_WM_NONREPARENTING=1

eval $(dircolors -b $HOME/.config/dir_colours)
