#!/bin/bash

while hyprctl clients | grep -Po '(?<=class:\s).*'; do
    hyprctl dispatch killwindow "class:^(kitty|alacritty)$"
    hyprctl dispatch closewindow "class:.*"
done
