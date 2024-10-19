#!/bin/bash

# Get the current backlight value
current_value=$(brightnessctl --device='tpacpi::kbd_backlight' get)

# Calculate the new backlight value
new_value=$(((current_value + 1) % 3))

# Set the new backlight value
brightnessctl --device='tpacpi::kbd_backlight' set $new_value
