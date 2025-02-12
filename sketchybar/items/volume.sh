#!/bin/bash

sketchybar --add item volume right \
  --rename "Control Center,Sound" volume_alias \
  --set volume script="$PLUGIN_DIR/volume.sh" \
  --subscribe volume volume_change \
  label.drawing=off \
  alias.color="$WHITE" \
  background.padding_right=0 \
  background.padding_left=0 \
  width=35
