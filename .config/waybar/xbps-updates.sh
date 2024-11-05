#!/bin/bash

Get_updates() {
  pkgs=$(xbps-install -nuM | awk '{print $1}')
  pkg_count=$(echo $pkgs | wc -w)
  pkg_list=$(echo $pkgs | sed 's/ /\\r/g')

  if [ $pkg_count -gt 0 ]; then
    notify-send "Updates available" "There are $pkg_count updates available for your system"
  fi

  echo "{\"text\":\"$pkg_count\", \"tooltip\":\"$pkg_list\"}"
}
