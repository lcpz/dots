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
alias v='nvim'
alias e='exit'
alias sv='sudo nvim'
alias m='neomutt'
alias r='ranger'
alias f='fff'
alias sr='sudo ranger'
alias z='zathura'
alias sxiv='nsxiv'
alias pacman='sudo pacman --color always'
alias pacs='sudo pacman --color always -S'
alias pacss='sudo pacman --color always -Ss'
alias pacqs='sudo pacman --color always -Qs'
alias pacqi='sudo pacman --color always -Qi'
alias pacr='sudo pacman --color always -Rscudn'
alias triq='trizen --color always -Qs'
alias tris='trizen --noedit --noconfirm --noinfo --needed -S'
alias triss='trizen -Ss'
alias awrc='$EDITOR $HOME/.config/awesome/rc.lua'
alias awtheme='$EDITOR $HOME/.config/awesome/themes/copland/theme-personal.lua'
alias awdir='cd $HOME/.config/awesome'
alias storage='sudo ntfs-3g /dev/sdb1 /mnt/storage; cd /mnt/storage'
alias win='sudo ntfs-3g /dev/sda2 /mnt/win; cd /mnt/win/Users/Luca/Desktop'
alias emptytrash='sudo rm -rf $HOME/.local/share/Trash/*'
alias mpvw='mpv --aspect=16:9'
alias tmux='tmux -2uv'
alias xi='xsel | xsel -i -b'
alias xb='xsel -b | xsel'
alias wh='wifi-start home'
alias startx2='startx -- -keeptty -nolisten tcp > $HOME/.xorg.log 2>&1'
alias commands='sed -n -e "0,/PROMPT/d" -e "s/alias //g" -e "s/=\x27/#/g" -e "/commands/d" -e "s/\x27//p" $HOME/.bashrc | column -t -s "#"'

complete -cf sudo
complete -cf doas
shopt -s cdspell
set -o posix
set show-all-if-ambiguous on
set completion-ignore-case on
eval $(dircolors -b $HOME/.config/dir_colours)

export EDITOR='nvim'
export AWT_TOOLKIT='MToolkit'
export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME=/usr/lib/jvm/java-18-openjdk
export TEXLIVE=/usr/local/texlive/2022
export PATH=$PATH:$TEXLIVE/bin/x86_64-linux:$HOME/.gem/ruby/3.0.0/bin:$JAVA_HOME/bin
export MANPATH=$MANPATH:$TEXLIVE/texmf-dist/doc/man
export INFOPATH=$INFOPATH:$TEXLIVE/texmf-dist/doc/info
