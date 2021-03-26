#!/usr/bin/env bash

pkill polybar

CONFIG=config

if [ "$DESKTOP_SESSION" == 'bspwm' ]; then
  CONFIG=config-bspwm
fi

while read -r my_monitor; do
  monitor_name="$(echo "$my_monitor" | awk '{ print $1; }')"
  is_primary="$(echo "$my_monitor" | grep 'primary' &>/dev/null; echo "$?")"

  echo "Monitor name: $monitor_name"
  echo "Is primary?: $is_primary"

  if [[ "$is_primary" == 0 ]]; then
    MONITOR="$monitor_name" polybar --reload --config="$HOME/.config/polybar/$CONFIG" pri &
  else
    MONITOR="$monitor_name" polybar --reload --config="$HOME/.config/polybar/$CONFIG" alt &
  fi
done < <(xrandr | grep ' connected ')

echo "Bars launched..."
