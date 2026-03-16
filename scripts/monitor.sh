#!/bin/bash
handle() {
  case $1 in
    monitorremoved*)
      # перенести всі воркспейси на eDP-1
      for i in 1 2 3 4 5; do
        hyprctl dispatch moveworkspacetomonitor "$i eDP-1"
      done
      ;;
    monitoradded*)
      # повернути воркспейси на HDMI
      for i in 1 2 3 4 5; do
        hyprctl dispatch moveworkspacetomonitor "$i HDMI-A-1"
      done
      ;;
  esac
}

socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
  handle "$line"
done
