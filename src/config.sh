#!/bin/bash

export EMAILS="${HOME}/.local/share/lucashi/emails"
export MAIL_SCRIPT="$RUN_DIR/src/disrupt.sh"
export FACTS_SOURCE="$RUN_DIR/assets/lucashifacts"

# controls how likely a lucashi image will be shown
# p = 1 / IMAGE_RARITY
export IMAGE_RARITY=10

# where the image assets are stored
export IMG_ASSET_DIR="${RUN_DIR}/assets/img"
