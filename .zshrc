HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

source $HOME/.config/zsh/autojump.zsh
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/vi-mode.zsh
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/env_variables.zsh

ZSH_AUTOSUGGEST_USE_ASYNC=1 
bindkey '^ ' autosuggest-accept #autocomplete selection(ctrl+space)
bindkey -s "^H" "^W" #remap ctrl+w to ctrl+backspace

#for colors and completion suggestion menu
autoload -U colors && colors
autoload -Uz compinit
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
compinit
DISABLE_UNTRACKED_FILES_DIRTY="true"


#linuxlogo -a -l | toilet --metal -f term | lolcat
array=( green yellow cyan white magenta )
/home/buddha/Clones/fm6000 -de BSPWM -r -c ${array[$(($RANDOM%5+1))]}

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
    if [ $# -eq 0 ]; then
        kdeconnect-cli -d $(kdeconnect-cli -l --id-only) --share $(dragon -x -t)
    else
        for var in "$@"
        do
            kdeconnect-cli -d $(kdeconnect-cli -l --id-only) --share $var
            echo "$var \n" 
        done
    fi
}

function cdrop(){
    cp $(dragon -x -t -p) .
}

function cid(){
    filename='/home/buddha/Code/python/webautomation/nepse_floorsheet/NEPSE/Stock.py';
    cat "$filename" | grep "\"id\"\:" --color;
    sed -i -e 's/"id":[0-9]\+/"id":'"$1"'/g' "$filename";
    cat "$filename" | grep "\"id\"\:" --color;
}

echo -ne '\e[5 q'
eval "$(starship init zsh)"
source ptSh_set_aliases

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND="fdfind -t d --hidden --follow"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_COMPLETION_TRIGGER='*'
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
