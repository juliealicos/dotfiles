#!/usr/bin/env sh

# Get the window information in JSON format
window_info=$(yabai -m query --windows --window)

# Check if the currently focused window is floating
is_floating=$(echo "$window_info" | jq '.["is-floating"]')
echo "${is_floating}"

if [ "${is_floating}" = "true" ]; then
    # If the window is not maximized, maximize it
    yabai -m window --grid 1:1:0:0:1:1

else
    yabai -m window --toggle zoom-fullscreen
fi
