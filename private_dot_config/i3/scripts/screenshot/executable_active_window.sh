#!/usr/bin/env bash
if [ "$1" == '-clipboard' ]; then
  if [ -z "${WAYLAND_DISPLAY}" ]; then
    echo "not available";
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
  if [ -z "${WAYLAND_DISPLAY}" ]; then
    echo "not available";
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