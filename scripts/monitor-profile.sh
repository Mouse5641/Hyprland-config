#!/bin/bash

CURRENT=$(hyprctl monitors | grep -c "^Monitor")

move_ws_to_monitor() {
    local ws=$1
    local monitor=$2
    # переключитись на воркспейс щоб він створився
    hyprctl dispatch workspace "$ws"
    # перемістити на потрібний монітор
    hyprctl dispatch moveworkspacetomonitor "$ws $monitor"
}

if [ "$CURRENT" -ge 2 ]; then
    move_ws_to_monitor 1 HDMI-A-1
    move_ws_to_monitor 2 HDMI-A-1
    move_ws_to_monitor 3 HDMI-A-1
    move_ws_to_monitor 4 HDMI-A-1
    move_ws_to_monitor 5 HDMI-A-1
    move_ws_to_monitor 6 eDP-1
    move_ws_to_monitor 7 eDP-1
    notify-send "Монітори" "Режим: два монітори"
else
    for i in 1 2 3 4 5 6 7; do
        move_ws_to_monitor "$i" eDP-1
    done
    notify-send "Монітори" "Режим: тільки ноутбук"
fi

# повернутись на воркспейс 1
hyprctl dispatch workspace 1
