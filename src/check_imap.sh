#!/usr/bin/env bash

if [[ ! -f $IMAP_SOURCE ]]; then
    exit 2
fi

if [[ $# -gt 1 ]]; then
    exit 1
fi

JSON="${RUN_DIR}/lib/JSON.sh"

MATCHING=$(${JSON} < "${IMAP_SOURCE}" 2>/dev/null| grep -v "\[\]" | grep "$1")
echo "$MATCHING" | cut -d']' -f2 | cut -d'"' -f2
