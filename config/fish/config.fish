# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# This file is run by all fish instances.
# To include configuration only for login shells, use
# if status is-login
#    ...
# end
# To include configuration only for interactive shells, use
# if status is-interactive
#   ...
# end

alias l="ls"
alias d="date +'%Y/%m/%d|%H/%M/%S'"
alias t="tree -C"
alias c="cd"
alias r="rm -r"
# alias m="micro" It was this, but then I switched to NeoVim on 2024/12/27. I have done this to force me to use nvim!
# Edit (2025/02/10): Fuck me, that was a good idea!
alias m="nvim"
alias n="nvim"
alias p="sudo pacman"
alias y="yay"

alias md="mkdir"
alias lb="lsblk"
alias ct="cat"
alias cl="curl"
alias am="alsamixer -c 0 --no-color"
alias pm="pacmixer"
alias co="xclip -selection clipboard -o"
alias ci="xclip -selection clipboard"
alias yt="mpv --ytdl-raw-options='format=bestvideo[height<=720]+bestaudio/best[height<=720],cookies-from-browser=chrome'"
alias +x="chmod +x"

###---===Git shit===---###
alias g="git"
alias ga="git add"
alias ga.="git add ."
alias gb="git branch"
alias gco="git commit"
alias gs="git status"
alias gc="git clone"
alias gch="git checkout"

alias cls="clear"
alias bat="ct /sys/class/power_supply/BAT1/capacity"
alias net="chromium"

alias prsl="LC_ALL='C' prusa-slicer"
alias scad="openscad"

alias yt-dlp-mp3="yt-dlp --extract-audio --audio-format mp3 -f bestaudio --no-playlist"
alias yt-dlp-mp3-list="yt-dlp --extract-audio --audio-format mp3 -f bestaudio --cookies-from-browser chrome --max-downloads"

alias autobacktrace="gdb -ex 'set confirm off' -ex 'set pagination off' -ex run -ex bt -ex q --args"

alias httpsrv="python3 -m http.server"

alias ipinf="curl https://ipinfo.io"

alias qbittorrent="QT_SCALE_FACTOR=0.75 QT_QPA_PLATFORM=xcb /usr/bin/qbittorrent"

function mcd
    # Check if the directory exists
    if not test -d $argv[1]
        # If it doesn't exist, create it
        mkdir -p $argv[1]
    end
    # Change to the directory
    cd $argv[1]
end

function fish_prompt
    echo -e ""
    set_color blue
    echo -n "╭"
    set_color normal
    echo -n "[$(date '+%Y/%m/%d[%H:%M:%S][%a]')]"  # Date and time
    set_color blue
    echo -n "="
    set_color green
    echo -n "$USER@$hostname "  # Name and hostname
    echo -e ""
    set_color blue
    echo -n "╰["(pwd | sed "s|$HOME|~|")"]" # Workin' dir
    set_color red
    echo -n "Ⓐ  ☭ ⛤ " # Of course...
    set_color normal
    echo -n "> "
end

# Environment variables
set -Ux GTK_THEME ShadowVector
set -Ux GTK_IM_MODULE ibus; set -Ux QT_IM_MODULE ibus; set -Ux XMODIFIERS @im=ibus
set -Ux QT_QPA_PLATFORMTHEME qt5ct
set -Ux EDITOR nvim
set PATH $PATH:$HOME/.local/bin/

# Cursor theme for Qt applications
set -gx XCURSOR_THEME "terminal-green"
set -gx XCURSOR_SIZE 24
set -gx XCURSOR_PATH "$HOME/.icons:$HOME/.local/share/icons:/usr/share/icons"

# Android-SDK
set -Ux ANDROID_HOME /opt/android-sdk/
set -Ux PATH $PATH:$ANDROID_HOME/cmdline-tools/latest/bin/:$ANDROID_HOME/platform-tools/:$ANDROID_HOME/build-tools/36.1/

# EMSDK
set -Ux EMSDK_QUIET 1
source /usr/lib/emsdk/emsdk_env.fish

if status is-interactive
    set date_time (date "+%Y/%m/%d[%H:%M:%S][%a]")

    rainbow

    echo "Login as ["(set_color red)"$USER"(set_color normal)"] at ["(set_color red)$date_time(set_color normal)"] to ["(set_color red)(uname -n)(set_color normal)"]. Not supposed to be in this system? Well done for getting in. Do what you like, you are being watched. Recepies for snacks and torrents on tap at /Eddie/ if you are interested."

    figlet -w 100 "*  ShadowVector OS  *" | lolcat -t -p 1
    echo "This machine is a ["(set_color red)(sudo dmidecode -s baseboard-manufacturer)" "(sudo dmidecode -s baseboard-product-name)" "(sudo dmidecode -s chassis-type)(set_color normal)"] rocking an ["(set_color red)(sudo dmidecode -s processor-manufacturer)" "(sudo dmidecode -s processor-family)(set_color normal)"] - Straight out of a dumpster, eh?"

    echo "Welcome ["(set_color red)(whoami)(set_color normal)"]. Today is ["(set_color red)(date +'%Y/%m/%d')(set_color normal)"]!"

    echo "Shade's joke of the session: (⌐■ᴗ ■)ノ" (set_color blue)(shuf -n 1 /etc/jokes.txt)(set_color normal)

    echo "Arch: ["(set_color red)(uname -m)(set_color normal)"]"

    rainbow
end

