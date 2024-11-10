#!/bin/bash

Help() {
    echo "A volume script to display an overlay while changing the volume."
    echo
    echo "Syntax: volume [-u|d|h]"
    echo "options:"
    echo "u     Volume up."
    echo "d     Volume down."
    echo "h     Display this help message."
    echo
}

Overlay() {
    percent=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
    percent=${percent:2}

    eww update icon="󰕾" percent=$percent
    eww open overlay
    
    if [ $counter -eq 0 ]; then
        eww close overlay
    fi
}

if [ $# -eq 0 ]; then
    Help
    exit
fi

while getopts ":hdu" option; do
    case $option in
        h) # displays help
            Help
            exit;;
        d) # screenshot full screen
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
            Overlay
            exit;;
        u) # select a portion and screenshot
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
            Overlay
            exit;;
        \?) # catchall
            Help
            exit;;
    esac
done