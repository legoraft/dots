#!/bin/bash

type="$1"
action="$2"
icon=""
percent=0

Help() {
    echo "An overlay script to display an overlay while changing certain settings."
    echo
    echo "Syntax: overlay [volume|brightness] [up|down]"
    echo "options:"
    echo "volume        adjust the volume"
    echo "brightness    adjust the brightness"
    echo "up            increase selected setting"
    echo "down          decrease selected setting"
    echo
}

Overlay() {
    eww update icon=$icon percent="$percent" && eww open overlay
    
    sleep 1
    
    if [ $bar_count -lt 1 ]; then
        eww close overlay
    fi
}

if [ $# -eq 0 ]; then
    Help
    exit
fi

if [ $type == "volume" ]; then
    percent=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
    percent=${percent//./}
    icon="󰕾"
    
    if [ $action == "up" ]; then
        if [ $percent -lt 100 ]; then
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        else
            exit
        fi
    elif [ $action == "down" ]; then
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    fi
elif [ $type == "brightness" ]; then
    percent=$(brightnessctl i | grep -E -o '[0-9]+' | sed -n 2p)
    icon="󰖨"
    
    if [ $action == "up" ]; then
        brightnessctl set +5%
    elif [ $action == "down" ]; then
        brightnessctl set 5%-
    fi
fi

Overlay