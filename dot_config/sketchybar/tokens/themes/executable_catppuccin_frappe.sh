#!/usr/bin/env bash

# Catppuccin Frappe Theme
# https://github.com/catppuccin/catppuccin

source "${CONFIG_DIR:-$HOME/.config/sketchybar}/tokens/helpers.sh"

export THEME_TYPE="dark"

export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF949cbb"
export COLOR_DARK_GRAY="0xFF626880"

export COLOR_BG1="0xFF303446"
export COLOR_BG2="0xFF414559"

generate_alpha_variants "WHITE" "0xFFc6d0f5"
generate_alpha_variants "BLACK" "0xFF232634"
generate_alpha_variants "RED" "0xFFe78284"
generate_alpha_variants "YELLOW" "0xFFe5c890"
generate_alpha_variants "BLUE" "0xFF8caaee"
generate_alpha_variants "GREEN" "0xFFa6d189"
generate_alpha_variants "MAGENTA" "0xFFca9ee6"
generate_alpha_variants "CYAN" "0xFF81c8be"
generate_alpha_variants "ORANGE" "0xFFef9f76"
generate_alpha_variants "TANGERINE" "0xFFea999c"
