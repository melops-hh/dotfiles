#!/bin/zsh

# Get macOS theme
is_dark_mode=$(osascript -e 'tell application "System Events" to tell appearance preferences to return dark mode')

# Set tmux configuration paths
# LIGHT_THEME_PATH="$HOME/.tmux-light.conf"
# DARK_THEME_PATH="$HOME/.tmux-dark.conf"

# Choose theme based on macOS theme
if [ "$is_dark_mode" = "true" ]; then
    # tmux source-file "$DARK_THEME_PATH"
    tmux source-file "$HOME/.config/tmux/conf/dark.conf"
    sed -i "" -e 's/catppuccin-latte/catppuccin-macchiato/' "$HOME/.config/alacritty/alacritty.toml"
else
    # tmux source-file "$LIGHT_THEME_PATH"
    sed -i "" -e 's/catppuccin-macchiato/catppuccin-latte/' "$HOME/.config/alacritty/alacritty.toml"
    tmux source-file "$HOME/.config/tmux/conf/light.conf"
fi

