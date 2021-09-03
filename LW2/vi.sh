#!/bin/bash

IFS=$'\n'
count=0

for file in $(find /var/log -name "*.log")
do
  for string in $(cat $file)
  do
    count=$(( $count + 1 ))
  done
done

echo $count
