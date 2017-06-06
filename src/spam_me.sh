#!/bin/bash

# shellcheck source=src/config.sh
source "$RUN_DIR/src/config.sh"

if [ -r "$EMAILS" ]; then
    xargs -n 1 "$MAIL_SCRIPT" < "$EMAILS"
else
    $MAIL_SCRIPT
fi
