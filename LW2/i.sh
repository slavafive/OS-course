#!/bin/bash

IFS=$'\n'

for string in $(grep -rh "ACPI" /var/log/)
do
  if [[ $(string:0:4) == "ACPI" ]]
  then
  echo $string
  fi
done > errors.log

for string in $(cat errors.log)
do
  IFS=$' '
  for word in $string
  do
    if [[ -n $(find / -name $word) ]]
    then
      if [ -f $word) ]
      then
        echo $string
        continue
      fi
    fi
  done
done
