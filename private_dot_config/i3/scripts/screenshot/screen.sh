#!/usr/bin/env bash
if [ "$1" == "-clipboard" ]; then
  if [ -z "${WAYLAND_DISPLAY}" ]; then
    maim | xclip -selection clipboard -t image/png;
  else
    grim - | wl-copy;
  fi
else
  if [ -z "${WAYLAND_DISPLAY}" ]; then
    maim ~/Pictures/screenshots/$(date +%s).png;
  else
    grim ~/Pictures/screenshots/$(date +%s).png;
  fi
fi
