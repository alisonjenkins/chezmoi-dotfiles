#!/usr/bin/env bash

pkill polybar

CONFIG=config

if [ "$DESKTOP_SESSION" == '/usr/share/xsessions/bspwm' ]; then
  CONFIG=config-bspwm
fi

for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar --reload pri --config="$HOME/.config/polybar/$CONFIG" &
done

echo "Bars launched..."