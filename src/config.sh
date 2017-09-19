#!/bin/bash

export MAIL_SCRIPT="$RUN_DIR/src/disrupt.sh"
export FACTS_SOURCE="$RUN_DIR/assets/lucashifacts"

# controls how likely a lucashi image will be shown
# p = 1 / IMAGE_RARITY
export IMAGE_RARITY=10

# Supa secret file pointers
export IMG_ASSET_DIR="$SECRETS/images"
export EMAILS="$SECRETS/emails"
export IMAP_SOURCE="$RUN_DIR/assets/related_imap.json"
