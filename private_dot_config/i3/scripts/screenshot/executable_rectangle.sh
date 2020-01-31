#!/usr/bin/env bash
if [ "$1" == '-clipboard' ]; then
  if [ -z "${WAYLAND_DISPLAY}" ]; then
    maim -s | xclip -selection clipboard -t image/png;
  else
    grim -g "$(slurp)" - | wl-copy;
  fi
else
  if [ -z "${WAYLAND_DISPLAY}" ]; then
    maim -s ~/Pictures/screenshots/$(date +%s).png;
  else
    grim -g "$(slurp)" ~/Pictures/screenshots/$(date +%s).png;
  fi
fi
