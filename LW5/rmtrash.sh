#!/bin/bash

curr=$(pwd)

if [ $# != 1 ]; then
echo Error, enter one parameter - file name
exit 1
fi

if [ -f $1 ]; then
:
else
echo Error, file $1 does not exist in this directory
exit 1
fi

cd $HOME/.trash 2>/dev/null || mkdir $HOME/.trash
cd $curr

a=$(cat /home/user/lab5/.uniqueName)
let a=$a+1
rm /home/user/lab5/.uniqueName
echo "$a" > /home/user/lab5/.uniqueName

if [[ ${1:0:1} == "/" ]]; then
  ln "$1" $HOME/.trash/$a
  rm "$1"
  echo "$1" $a >> $HOME/.trash.log
else
  ln $curr/"$1" $HOME/.trash/$a
  rm $curr/"$1"
  echo "$curr/$1" $a >> $HOME/.trash.log
fi
