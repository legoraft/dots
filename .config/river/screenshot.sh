#!/bin/bash

Help() {
    echo "This script is a simple frontend to use grim and slurp in a more simplistic way."
    echo
    echo "Syntax: screenshot [-s|f|h]"
    echo "options:"
    echo "s     Select a portion of the screen and take a screenshot."
    echo "f     Screenshot the full screen."
    echo "h     Display this help message."
    echo
}

if [ $# -eq 0 ]; then
    Help
    exit
fi

if [ ! -d $HOME/Pictures/screenshots ]; then
    mkdir -p $HOME/Pictures/screenshots
fi

while getopts ":hfs" option; do
    case $option in
        h) # displays help
            Help
            exit;;
        f) # screenshot full screen
            grim "$HOME/Pictures/screenshots/$(date +'%Y-%m-%d_%H.%M.%S.png')"
            exit;;
        s) # select a portion and screenshot
            grim -g "$(slurp)" "$HOME/Pictures/screenshots/$(date +'%Y-%m-%d_%H.%M.%S.png')"
            exit;;
        \?) # catchall
            Help
            exit;;
    esac
done