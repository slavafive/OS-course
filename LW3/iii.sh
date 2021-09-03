#!bin/bash

for i in $(ls /proc | grep -E [0-9] | sort -nr)
do
if [[ $(cat /proc/$i/maps 2>/dev/null | awk ' {print $6} ' | grep -E ".*\/sbin/.*") ]]
then 
echo "$i"
fi
done > out3
