#!/bin/bash
export RUN_DIR
if [ $# -lt 1 ]
  then
    echo "No RUN_DIR specified, assuming current dir is RUN_DIR"
    RUN_DIR="."
else
    RUN_DIR="$1"
fi
(
cd "$RUN_DIR" || exit 1 
"$RUN_DIR"/src/spam_me.sh || exit 1
)
