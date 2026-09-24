#!/bin/bash
source "$CONFIG_DIR/theme.sh"

# Récupérer l'ID de la fenêtre active
active_id=$(yabai -m query --windows --window | jq -r '.id')

# Récupérer toutes les fenêtres de l'espace actuel
windows=$(yabai -m query --windows --space)
window_ids=$(echo "$windows" | jq -r '.[].id')

# Nettoyer les anciens items qui n'existent plus
for item in $(sketchybar --query bar | jq -r '.items[] | select(startswith("window."))'); do
    id=$(echo "$item" | sed 's/window\.//')
    if ! echo "$window_ids" | grep -q "^$id$"; then
        sketchybar --remove window.$id
    fi
done

# Mettre à jour ou créer les items
echo "$windows" | jq -c '.[]' | while read -r window; do
    app=$(echo "$window" | jq -r '.app')
    window_id=$(echo "$window" | jq -r '.id')

    # Vérifier si actif
    if [ "$window_id" = "$active_id" ]; then
        bg_drawing=on
        label_color=$BASE
    else
        bg_drawing=off
        label_color=$TEXT
    fi

    # Mettre à jour ou créer
    sketchybar --set window.$window_id \
               background.drawing=$bg_drawing \
               label.color=$label_color \
               2>/dev/null || \
    sketchybar --add item window.$window_id left \
               --set window.$window_id \
               label="$app" \
               background.color=$BLUE \
               background.corner_radius=5 \
               background.height=25 \
               background.drawing=$bg_drawing \
               label.color=$label_color \
               label.padding_left=2 \
               label.padding_right=10 \
               label.y_offset=0 \
               padding_left=2 \
               padding_right=2 \
               click_script="yabai -m window --focus $window_id"
done
