#!/usr/bin/env bash
set -euo pipefail
ACTIVE_MONS=( $(xrandr --listactivemonitors ) )
ACTIVE_MONS=( "${ACTIVE_MONS[@]:2}" )
ACTIVE_MONS_COUNT=$(("${#ACTIVE_MONS[@]}" / 4))

if [ ! "$ACTIVE_MONS_COUNT" -gt 1 ]; then
  exit 0;
fi

XRANDR_COMMAND="xrandr"
for MONITOR_NUM in $(seq 0 $(("$ACTIVE_MONS_COUNT" - 1))); do
  MON_METADATA_OFFSET=$(("$MONITOR_NUM" * 4))
  MON_DISPLAY_NAME="${ACTIVE_MONS[$(($MON_METADATA_OFFSET + 3))]}"
  if [ "$MONITOR_NUM" -gt 0 ]; then
    PREV_DISPLAY_NAME="${ACTIVE_MONS[$(($MON_METADATA_OFFSET - 1))]}"
  else
    PREV_DISPLAY_NAME=""
  fi

  if [ ! "$MONITOR_NUM" -gt 0 ]; then
    MON_POSITION=""
  else
    MON_POSITION="--right-of $PREV_DISPLAY_NAME";
  fi

  XRANDR_COMMAND="$XRANDR_COMMAND --output $MON_DISPLAY_NAME ${MON_POSITION}"

  eval $XRANDR_COMMAND

done
