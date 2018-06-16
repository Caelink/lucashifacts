#!/bin/bash

# shellcheck source=src/config.sh
source "$CONFIG"

if [ -r "$EMAILS" ]; then
    xargs -n 1 "$MAIL_SCRIPT" < "$EMAILS"
else
    $MAIL_SCRIPT
fi

