#!/usr/bin/env bash

pkill polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar --reload bar1 &
done

echo "Bars launched..."