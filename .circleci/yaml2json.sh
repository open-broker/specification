#!/usr/bin/env sh
FILES=$(/bin/ls -1 $1|grep -E '.ya?ml')
cd $1 || exit
ls $2 || exit
echo -e "Converting schema in $1:"
for f in $FILES
do
	NEW_NAME=$(echo $f|cut -d '.' -f 1)
	NEW_NAME="$NEW_NAME.json"
	echo -e "\t$f -> $2/$NEW_NAME" 
	yaml2json < $f > "$2/$NEW_NAME"
done