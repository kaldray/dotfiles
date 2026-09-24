#!/usr/bin/env bash
source "$CONFIG_DIR/plugins/icon.sh"
source "$CONFIG_DIR/core/env.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

if pgrep -x "Amphetamine" > /dev/null; then
  SESSION=$(osascript -e 'tell application "Amphetamine" to get session is active' 2>/dev/null)

  if [ "$SESSION" = "true" ]; then
    ICON=$(get_widget_icon "coffee_off")
  else
    ICON=$(get_widget_icon "coffee_on")
  fi
else
  ICON=$(get_widget_icon "coffee_on")
fi

sketchybar --set amphetamine.icon icon="$ICON"
