#!/bin/bash

while hyprctl clients -j | jq -r '.[].class' | grep -qE '.*'; do
    hyprctl dispatch killwindow "class:^(kitty)$"
    hyprctl dispatch closewindow "class:.*"
done
