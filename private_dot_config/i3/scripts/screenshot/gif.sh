#!/usr/bin/env bash
if [ "$1" == '-clipboard' ]; then
  if [ -z "${WAYLAND_DISPLAY}" ]; then
    region=$(slop)
    regex="^([0-9]*)x([0-9]*)\+([0-9]*)\+([0-9]*)"

    if [[ $region =~ $regex ]]
    then
      X="${BASH_REMATCH[3]}"
      Y="${BASH_REMATCH[4]}"
      WIDTH="${BASH_REMATCH[1]}"
      HEIGHT="${BASH_REMATCH[2]}"

      byzanz-record -x "$X" -y "$Y" -w "$WIDTH" -h "$HEIGHT" - | xclip -selection clipboard -t image/gif;
    fi
  else
    # grim -g "$(slurp)" - | wl-copy;
    echo "No recorder setup for wayland"
  fi
else
  if [ -z "${WAYLAND_DISPLAY}" ]; then
    region=$(slop)
    regex="^([0-9]*)x([0-9]*)\+([0-9]*)\+([0-9]*)"

    if [[ $region =~ $regex ]]
    then
      X="${BASH_REMATCH[3]}"
      Y="${BASH_REMATCH[4]}"
      WIDTH="${BASH_REMATCH[1]}"
      HEIGHT="${BASH_REMATCH[2]}"

      byzanz-record -x "$X" -y "$Y" -w "$WIDTH" -h "$HEIGHT" "$HOME/Pictures/screenshots/$(date +%s).gif";
    fi
  else
    # grim -g "$(slurp)" ~/Pictures/screenshots/$(date +%s).png;
    echo "No recorder setup for wayland"
  fi
fi
