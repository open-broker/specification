#!/usr/bin/env sh
FILES=$(/bin/ls -1 $1|grep -E '.ya?ml')
DIR="/tmp/workspace/json"
cd $1 || exit
mkdir -p $DIR/$1
echo -e "Converting schema in $1:"
echo -e "\tschema.yaml -> $DIR/$1/schema.json" 
yaml2json < schema/schema.yaml > "$DIR/$1/schema.json"