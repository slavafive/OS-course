#!/bin/bash

IFS=$'\n'
previousCurr=0
count=0
sum=0

for string in $(cat out5)
do
	ppid=$(echo $string | awk -F ":" '{print $2}' | awk -F "=" '{print $2}')
	curr=$ppid

	if [[ $curr -ne $previousCurr ]]; then
		echo Average_Sleeping_Children_of_Parent=$previousCurr is $(echo $sum / $count | bc -l)
		count=0
		sum=0
	fi

	sum=$(echo $sum + $(echo $string | awk -F ":" '{print $3}' | awk -F "=" '{print $2}') | bc )
	count=$(( $count + 1 ))
	previousCurr=$ppid
	echo $string
done > out6

echo Average_Sleeping_Children_of_Parent=$previousCurr is $(echo $sum / $count | bc -l)
