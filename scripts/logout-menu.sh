#!/bin/bash

# Get width and height of the focussed monitor.
MONITORS=$(hyprctl monitors -j)
WIDTH=$(echo $MONITORS | jq 'first(.[] | select(.focused == true)) | .width')
HEIGHT=$(echo $MONITORS | jq 'first(.[] | select(.focused == true)) | .height')

# Calculate percentage based margins.
HORIZONTAL_MARGIN=$(awk "BEGIN { print int($WIDTH * 0.2) }")
VERTICAL_MARGIN=$(awk "BEGIN { print int($HEIGHT * 0.35) }")

# Launch wlogout with margins.
wlogout -b 4 -L $HORIZONTAL_MARGIN -R $HORIZONTAL_MARGIN -T $VERTICAL_MARGIN -B $VERTICAL_MARGIN --protocol layer-shell --no-span ~/.config/wlogout/style.css 
