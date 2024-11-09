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
            exit;;
        u) # select a portion and screenshot
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
            exit;;
        \?) # catchall
            Help
            exit;;
    esac
done