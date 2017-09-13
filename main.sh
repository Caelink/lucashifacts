#!/bin/bash

usage() {
    echo "./main.sh -r|--rundir [Run directory] -c|--config [config file] -u|--update-first -h|--help"
    exit 2
}

update() {
(
    cd ~/lucashifacts/ || exit 1
    git fetch --all
    git checkout master
    git pull
)
}

export RUN_DIR
export CONFIG
export TEST
export SECRETS

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -r|--rundir)
    RUN_DIR="$2"
    shift # past argument
    ;;
    -c|--config)
    CONFIG="$2"
    shift # past argument
    ;;
    -s|--secrets)
    SECRETS="$2"
    shift # past argument
    ;;
    -h|--help)
    echo "Need Help?"
    usage
    ;;
    -u|--update-first)
    update
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

if [[ -z "$RUN_DIR" ]]; then
    (>&2 echo "No RUN_DIR specified, assuming current dir is RUN_DIR")
    RUN_DIR="." || usage
fi

if [[ -z "$CONFIG" ]]; then
    (>&2 echo "No Config specified, looking for it in $RUN_DIR/src/config.sh")
    CONFIG="$RUN_DIR/src/config.sh" || usage
fi

if [[ -z "$SECRETS" ]]; then
    (>&2 echo "No secrets dir specified, assuming it is ~/.local/share/lucashi")
    SECRETS="${HOME}/.local/share/lucashi" || usage
fi

(
cd "$RUN_DIR" || exit 1 
"$RUN_DIR"/src/spam_me.sh || exit 1
)

