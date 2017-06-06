#!/bin/bash

export RUN_DIR
RUN_DIR=$(mktemp -d lucashifactsi.XXXXXXX) || exit 1
git clone https://github.com/Caelink/lucashifacts.git "$RUN_DIR"
(
cd "$RUN_DIR" || exit 1 
"$RUN_DIR"/src/spam_me.sh || exit 1
)
rm -rf "$RUN_DIR"
