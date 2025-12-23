#!/bin/bash

FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)

if [ "$1" = "$FOCUSED" ]; then
  sketchybar --set $NAME background.drawing=on \
                         icon.color=0xff1e1e2e \
                         background.color=0xff89b4fa
else
  # Check if workspace has windows
  WIN_COUNT=$(aerospace list-windows --workspace "$1" 2>/dev/null | wc -l | tr -d ' ')
  if [ "$WIN_COUNT" -gt 0 ]; then
    # Has windows but not focused - dim highlight
    sketchybar --set $NAME background.drawing=on \
                           icon.color=0xffcad3f5 \
                           background.color=0xff45475a
  else
    # Empty workspace
    sketchybar --set $NAME background.drawing=off \
                           icon.color=0xff6c7086
  fi
fi
