#!/usr/bin/env bash
shopt -s nullglob globstar

if ! command -v rofi >/dev/null 2>&1; then
  echo "Please install rofi."
  exit 1
fi

function window() {
  if [ "$1" == '-clipboard' ]; then
    if [ -z "${WAYLAND_DISPLAY}" ]; then
      echo "not available on X11";
    else
      ACTIVE_MON=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')
      ACTIVE_WINDOW_GEOM=$(swaymsg -t get_tree | jq -r ".nodes | map(select(.name == \"${ACTIVE_MON}\")) | .[0].nodes | .[].nodes | select(.[].focused) | .[].rect")
      GEOM_X=$(echo "${ACTIVE_WINDOW_GEOM}" | jq -r ".x")
      GEOM_Y=$(echo "${ACTIVE_WINDOW_GEOM}" | jq -r ".y")
      GEOM_WIDTH=$(echo "${ACTIVE_WINDOW_GEOM}" | jq -r ".width")
      GEOM_HEIGHT=$(echo "${ACTIVE_WINDOW_GEOM}" | jq -r ".height")
      grim -g "$(echo \"${GEOM_X},${GEOM_Y} ${GEOM_WIDTH}x${GEOM_HEIGHT}\")" - | wl-copy
    fi
  else
    mkdir -p "${HOME}/Pictures/screenshots"

    if [ -z "${WAYLAND_DISPLAY}" ]; then
      echo "not available on X11";
    else
      ACTIVE_MON=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')
      ACTIVE_WINDOW_GEOM=$(swaymsg -t get_tree | jq -r ".nodes | map(select(.name == \"${ACTIVE_MON}\")) | .[0].nodes | .[].nodes | select(.[].focused) | .[].rect")
      GEOM_X=$(echo "${ACTIVE_WINDOW_GEOM}" | jq -r ".x")
      GEOM_Y=$(echo "${ACTIVE_WINDOW_GEOM}" | jq -r ".y")
      GEOM_WIDTH=$(echo "${ACTIVE_WINDOW_GEOM}" | jq -r ".width")
      GEOM_HEIGHT=$(echo "${ACTIVE_WINDOW_GEOM}" | jq -r ".height")
      grim -g "$(echo \"${GEOM_X},${GEOM_Y} ${GEOM_WIDTH}x${GEOM_HEIGHT}\")" ~/Pictures/screenshots/$(date +%s).png;
    fi
  fi
}

function selection() {
  if [ "$1" == '-clipboard' ]; then
    if [ -z "${WAYLAND_DISPLAY}" ]; then
      if ! command -v maim >/dev/null 2>&1; then
        echo "Please install maim."
        exit 1
      fi

      if ! command -v xclip >/dev/null 2>&1; then
        echo "Please install xclip."
        exit 1
      fi

      maim -s | xclip -selection clipboard -t image/png;
    else
      if ! command -v grim >/dev/null 2>&1; then
        echo "Please install grim."
        exit 1
      fi

      if ! command -v slurp >/dev/null 2>&1; then
        echo "Please install slurp."
        exit 1
      fi

      if ! command -v wl-copy >/dev/null 2>&1; then
        echo "Please install wl-copy."
        exit 1
      fi

      grim -g "$(slurp)" - | wl-copy;
    fi
  else
    mkdir -p "${HOME}/Pictures/screenshots"

    if [ -z "${WAYLAND_DISPLAY}" ]; then
      maim -s ~/Pictures/screenshots/$(date +%s).png;
    else
      grim -g "$(slurp)" ~/Pictures/screenshots/$(date +%s).png;
    fi
  fi
}

screenshot_types=( "selection" "window" )
type=$(printf '%s\n' "${screenshot_types[@]}" | rofi -dmenu "$@")

case $type in
  "selection")
    selection "$@"
    ;;
  "window")
    window "$@"
    ;;
  *)
    echo "Screenshot type '$type' not found."
    exit 1
    ;;
esac
