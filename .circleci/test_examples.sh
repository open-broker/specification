#!/usr/bin/env sh
# This script requires NPM library ajv
# in order to test the examples against a json schema.
# Install it with 'npm -g install ajv'

if ! which ajv; then
    echo -n "ajv is not installed, install it with "
    echo "'npm -g install ajv' to run this script"
    exit 3
fi

DIR="/tmp/workspace/json"
cd $1 || exit
EXAMPLES="example"
if [ "$(ls -A $EXAMPLES)" ]; then
    echo "Found examples"
else
    echo "Found no examples in $EXAMPLES"
    exit 1
fi

FILES=$(/bin/ls -1 $EXAMPLES|grep -E '.json')
cd $EXAMPLES || exit 2
for f in $FILES
do
    jq .data $f > /tmp/$f
    ajv test -s "$DIR/$1/schema.json" -d /tmp/$f --valid
done