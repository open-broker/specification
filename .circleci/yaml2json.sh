#!/usr/bin/env sh
FILES=$(/bin/ls -1 $1|grep -E '.ya?ml')
cd $1 || exit
echo -e "Converting schema in $1:"
for f in $FILES
do
	NEW_NAME=$(echo $f|cut -d '.' -f 1)
	NEW_NAME="$NEW_NAME.json"
	echo -e "\t$f -> $NEW_NAME" 
	yaml2json < $f > $NEW_NAME
done