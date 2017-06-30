#!/usr/bin/env bash

SITES_AVAILABLE=/etc/nginx/sites-available
SITES_ENABLED=/etc/nginx/sites-enabled

# https://stackoverflow.com/questions/630372/determine-the-path-of-the-executing-bash-script
SCRIPT_PATH="`dirname \"$0\"`"              # relative
SCRIPT_PATH="`( cd \"$SCRIPT_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$SCRIPT_PATH" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi

cp ${SCRIPT_PATH}/../config/playground.conf $SITES_AVAILABLE
ln -s ${SITES_AVAILABLE}/playground.conf ${SITES_ENABLED}/playground.conf

rm ${SITES_ENABLED}/default