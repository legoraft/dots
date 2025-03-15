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

SCREENSHOT_DATE=$(date +'%Y-%m-%d_%H.%M.%S')
SCREENSHOT_PATH="$HOME/Pictures/screenshots/$SCREENSHOT_DATE.png"

while getopts ":hfs" option; do
    case $option in
        h) # displays help
            Help
            exit;;
        f) # screenshot full screen
            grim $SCREENSHOT_PATH
            notify-send -i $SCREENSHOT_PATH "Screenshot" "New screenshot saved as $SCREENSHOT_DATE.png"
            exit;;
        s) # select a portion and screenshot
            grim -g "$(slurp)" $SCREENSHOT_PATH
            notify-send -i $SCREENSHOT_PATH "Screenshot" "New screenshot saved as $SCREENSHOT_DATE"
            exit;;
        \?) # catchall
            Help
            exit;;
    esac
done