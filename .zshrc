#ZSH_DISABLE_COMPFIX=true
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

source $HOME/.config/zsh/autojump.zsh
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/vi-mode.zsh
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_USE_ASYNC=1
bindkey '^ ' autosuggest-accept

###environment variables for f=pfetch
export PF_INFO="ascii title os wm editor shell kernel uptime palette "
export PF_ASCII="linux"


autoload -U colors && colors
autoload -Uz compinit
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
compinit


# User configuration
#linuxlogo -a -l | toilet --metal -f term | lolcat

pfetch

function ranger-cd {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}
bindkey -s '^o' 'ranger-cd\n'

function ddrop(){
    echo number of arguments=$#
    [ $# -ne 0 ] && wget $(dragon -x -t) -O $1|| wget $(dragon -x -t)
}


function cwifi() {
    #add new connection to wifi
    nmcli con add type wifi con-name $1 ifname wlp1s0 ssid $1;
    nmcli con mod $1 wifi-sec.key-mgmt wpa-psk;
    nmcli con mod $1 wifi-sec.psk $2;
    nmcli con up $1
}


function rcwifi(){
    #connect to wifi
    x=$1
    nmcli con up $x 
}


function delwifi(){
    nmcli con delete id $1
}

function qrwifi(){
    #qrcode with wifi information
    nmcli device wifi show
}

function venv(){
    source ~/Environments/$1/bin/activate
}

function sftm(){
    #send files to mobile
    for var in "$@"
    do
        kdeconnect-cli -d $(kdeconnect-cli -l --id-only) --share $var
        echo "$var \n" 
    done
}


if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
PATH="/usr/sbin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/home/$USER/.config/rofi/bin/:$PATH"
#PATH="/home/$USER/.local/kitty.app/bin/:$PATH"
PATH="$JAVA_HOME/bin:$PATH"
PATH="/home/$USER/.local/flutter/bin/:$PATH"

#user aliases
alias ls='ls --color'
alias sd='shutdown 0'
alias rb='reboot'
alias mf='sdcv'
alias venvpy='source ~/Environments/alien/bin/activate'
alias ttime='tty-clock -c -s -c 4'
alias clear='clear -x'
alias rs='./manage.py runserver'
alias mm='./manage.py makemigrations'
alias mi='./manage.py migrate'
alias python='python3'
alias pm='python manage.py'
alias capture='/opt/miscellaneous/hi.py'
alias clipin='xclip -selection c'
alias clipout='xclip -o -selection c'
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

#cat ~/.cache/wal/sequences

echo -ne '\e[5 q'
eval "$(starship init zsh)"

