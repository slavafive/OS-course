#!bin/bash

proceses=$(ls /proc | grep -E [0-9])

for proces in $proceses
do
if [[ $(cat /proc/$proces/statm 2>/dev/null) ]]; then
echo $proces:$(cat /proc/$proces/statm | awk '{print $2-$3}')	
fi
done | sort -t ':' -nr -k2 > out4 

