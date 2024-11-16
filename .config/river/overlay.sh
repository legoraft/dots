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
    echo "mute          mute (only for volume)"
    echo
}

Overlay() {
    eww update bar_icon=$icon percent="$percent" && eww open overlay
    time=$(date "+%s%N")
    echo $time > /tmp/overlay_time

    sleep 2
    
    old_time=$(cat /tmp/overlay_time)
    if [ $old_time -eq $time ] ; then
        eww close overlay
    fi
}

if [ $# -lt 2 ]; then
    Help
    exit
fi

if [ "$type" == "volume" ]; then
    percent=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
    percent=${percent//./}
    icon="󰕾"
    
    if [ $action == "up" ]; then
        if [ $percent -lt 100 ]; then
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
            percent=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
            percent=${percent//./}
        else
            exit
        fi
    elif [ $action == "down" ]; then
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        percent=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
        percent=${percent//./}
    elif [ $action == "mute" ]; then
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        mute=$(echo $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}'))
        
        if [ $mute == "[MUTED]" ]; then
            percent=0
            icon="󰝟"
        elif [ $mute == "" ]; then
            percent=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
            percent=${percent//./}
            icon="󰕾"
        fi
    fi
elif [ $type == "brightness" ]; then
    icon="󰖨"
    
    if [ $action == "up" ]; then
        brightnessctl set +5%
    elif [ $action == "down" ]; then
        brightnessctl set 5%-
    fi
    
    percent=$(brightnessctl i | grep -E -o '[0-9]+' | sed -n 2p)
fi

Overlay