#!/usr/bin/env bash
if [ "$1" == '-clipboard' ]; then
  if [ -z "${WAYLAND_DISPLAY}" ]; then
    echo "not available";
  else
    grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | wl-copy;
  fi
else
  if [ -z "${WAYLAND_DISPLAY}" ]; then
    echo "not available";
  else
    grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') ~/Pictures/screenshots/$(date +%s).png;
  fi
fi
