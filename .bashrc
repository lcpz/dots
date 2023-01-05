[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach

[ -d $HOME/bin ] && export PATH=$PATH:$HOME/bin

function __prompt_command() {
    PS1=" \[\e[1;34m\]\u\[\e[0m\]  \W  "
}

export PROMPT_COMMAND=__prompt_command

alias rm='rm -i'
alias l='ls -lh --color=always --group-directories-first --sort=size | coloredls'
alias ls='ls -h --color=auto'
alias v='nvim'
alias e='exit'
alias sv='sudo nvim'
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

export EDITOR='nvim'
export JAVA_HOME=/usr/lib/jvm/java-19-openjdk
export TEXLIVE=/usr/local/texlive/2022
export PATH=$PATH:$TEXLIVE/bin/x86_64-linux:$HOME/.gem/ruby/3.0.0/bin:$JAVA_HOME/bin
export MANPATH=$MANPATH:$TEXLIVE/texmf-dist/doc/man
export INFOPATH=$INFOPATH:$TEXLIVE/texmf-dist/doc/info

set -o vi

[[ ${BLE_VERSION-} ]] && ble-attach
