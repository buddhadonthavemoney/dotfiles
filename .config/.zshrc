#ZSH_DISABLE_COMPFIX=true
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
export _JAVA_AWT_WM_NONREPARTENTING=1
source $HOME/.config/zsh/autojump.zsh
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/vi-mode.zsh
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_USE_ASYNC=1
bindkey '^ ' autosuggest-accept


#export ZSH="/home/buddha/.oh-my-zsh"
#source $ZSH/oh-my-zsh.sh
#plugins=(git zsh-syntax-highlighting autojump vi-mode)
#function virtenv_indicator {
#    if [[ -z $VIRTUAL_ENV ]] then
#        psvar[1]=''
#    else
#        psvar[1]=${VIRTUAL_ENV##*/}
#    fi
#}
##add-zsh-hook precmd virtenv_indicator
#ZSH_THEME="robbyrussell"

autoload -U colors && colors
autoload -Uz compinit
compinit



# User configuration
linuxlogo -a -l | toilet --gay -f term 
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

function chwifi() {
    nmcli con add type wifi con-name $1 ifname wlp1s0 ssid $1;
    nmcli con mod $1 wifi-sec.key-mgmt wpa-psk;
    nmcli con mod $1 wifi-sec.psk $2;
    nmcli con up $1
}


function rcwifi(){
    (( $1 )) && nmcli con up $1 || nmcli con up anaklusmus
}


function cwifi(){
}


function venv(){
    source ~/Environments/$1/bin/activate
}


if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
PATH="/usr/sbin:$PATH"
PATH="/snap/bin:$PATH"
PATH="$JAVA_HOME/bin:$PATH"
#user aliases
alias ls='ls --color'
alias sd='shutdown 0'
alias mf='sdcv'
alias venvpy='source ~/Environments/alien/bin/activate'
alias ttime='tty-clock -c -s -c 4'
alias clear='clear -x'
alias rs='./manage.py runserver'
alias mm='./manage.py makemigrations'
alias mi='./manage.py migrate'
alias python='python3'
alias pm='python manage.py'
alias st='speed-test'
alias clipin='xclip -selection c'
alias clipout='xclip -o -selection c'

cat ~/.cache/wal/sequences

eval "$(starship init zsh)"
