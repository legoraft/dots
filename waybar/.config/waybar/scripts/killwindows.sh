#!/bin/bash

while hyprctl clients | grep -qE '.*'; do
    hyprctl dispatch killwindow "class:^(kitty)$"
    hyprctl dispatch closewindow "class:.*"
done
