HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
(cat ~/.cache/wal/sequences &)

source $HOME/.config/zsh/autojump.zsh
source $HOME/.config/zsh/fast-syntax-highlighting/F-Sy-H.plugin.zsh
source $HOME/.config/zsh/vi-mode.zsh
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/aliases.zsh
export FLYCTL_INSTALL="/home/buddha/.fly"
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
# linuxlogo -a -l | toilet --metal -f term | lolcat
array=( green yellow cyan white magenta )
fm6000 -de BSPWM -r -c ${array[$(($RANDOM%5+1))]}

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
    nmcli con add type wifi con-name $1 ifname wlp0s20f3 ssid $1;
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

function countdown () {
	start="$(( $(date '+%s') + $1))" 
	while [ $start -ge $(date +%s) ]
	do
		time="$(( $start - $(date +%s) ))" 
		printf '%s \033[2j\033[0m' "$(date -u -d "@$time" +%H:%M:%S)" | figlet 
		sleep 0.1
    clear
		printf '%s \033[2j\033[0m' "$(date -u -d "@$time" +%H:%M:%S)" | figlet 
	done
	for i in {1..7}
	do
		espeak "timer done"
	done
}

function stopwatch() {
    local BEGIN=$(date +%s)
    echo Starting Stopwatch...

    while true; do
        local NOW=$(date +%s)
        local DIFF=$(($NOW - $BEGIN))
        local MINS=$(($DIFF / 60))
        local SECS=$(($DIFF % 60))
        local HOURS=$(($DIFF / 3600))
        local DAYS=$(($DIFF / 86400))

        printf "\r:%02d:%02d:%02d" $HOURS $MINS $SECS | figlet | lolcat
        sleep 0.5
    done
}

echo -ne '\e[5 q'
eval "$(starship init zsh)"
source $HOME/.config/zsh/additional-config.zsh
