#!/bin/bash

# Get macOS theme
is_dark_mode=$(osascript -e 'tell application "System Events" to tell appearance preferences to return dark mode')

# Set tmux configuration paths
LIGHT_THEME_PATH="$HOME/.config/tmux/plugins/ca
DARK_THEME_PATH="$HOME/.tmux-dark.conf"

# Choose theme based on macOS theme
if [ "$is_dark_mode" = "true" ]; then
    tmux source-file "$DARK_THEME_PATH"
else
    tmux source-file "$LIGHT_THEME_PATH"
fi
