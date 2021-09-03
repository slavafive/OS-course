#!/bin/bash

IFS=$'\n'
curr=1

for string in $(cat /etc/passwd)
do
  curr=1
  IFS=:
  for word in $string
  do
    if [[ $curr -eq 1 ]]
    then
    user=$word
    fi
    
    if [[ $curr -eq 3 ]]
    then
    uid=$word
    fi
    curr=$(( $curr + 1 ))
  done
  echo $user':'$uid
done | sort -t: -n -k2
