#!/bin/bash
IFS=$'\n'
curr=$(pwd)

if [ $# != 1 ]; then
echo Error, enter one parameter - file name
exit 1
fi

flag=0

for string in $(cat $HOME/.trash.log)
do
link=$(echo "$string" | awk '{print $2}')
path=$(echo "$string" | awk '{print $1}')
name=$(echo "$path" | awk -F "/" '{print $NF}')
if [[ $name == $1 ]]
then
echo "Do you want to restore this file? (y/n)"
echo $path
read answer
if [[ $answer == "y" ]]; then
ln $HOME/.trash/$link $curr/"$1" 2>/dev/null || (ln $HOME/.trash/$link $HOME/"$1" | echo "File created in $HOME")
rm $HOME/.trash/$link

for i in $(cat $HOME/.trash.log)
do
currPath=$(echo "$i" | awk '{print $1}')
if [[ $currPath != $path ]]; then
echo $i
fi
done >> buff
cat buff > $HOME/.trash.log
rm buff

fi
flag=1
fi
done

if [ $flag == 0 ]; then
echo File does not exist
fi
