#!/bin/bash

Help() {
  echo "This script allows you to check for updates and update the system from waybar."
  echo
  echo "Syntax: xbps-updates [-c|u|h]"
  echo "options:"
  echo "c     Checks for updates"
  echo "u     Updates the system"
  echo "h     Display this help message."
  echo
}

Get_updates() {
  pkgs=$(xbps-install -nuM | awk '{print $1}')
  pkg_count=$(echo $pkgs | wc -w)
  pkg_list=$(echo $pkgs | sed 's/ /\\r/g')

  if [ $pkg_count -gt 0 ]; then
    notify-send "Updates available" "There are $pkg_count updates available for your system"
  fi

  echo "{\"text\":\"$pkg_count\", \"tooltip\":\"$pkg_list\"}"
}

while getopts ":hcu" option; do
  case $option in
    h) # displays help
      Help
      exit;;
    c) # checks for updates
      Get_updates
      exit;;
    u) # updates system
      echo "update"
      exit;;
    \?) # catchall
      Help
      exit;;
  esac
done
