#!/usr/bin/env sh
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
	ajv test -s "$DIR/$1/schema.json" -d $f --valid
done