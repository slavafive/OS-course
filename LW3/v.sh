#!bin/bash

processes=$(ls /proc | grep -E [0-9])

for process in $processes
do
if [[ $(cat /pric/$process/status 2>/dev/null) ]]; then
echo -n ProcessID=$(cat /proc/$process/status | awk '{if ($1 == "Pid:") print $2 }')" : "
echo -n Parent_ProcessID=$(cat /proc/$process/status | awk '{if ($1 == "PPid:") print $2 }')" : "
echo Average_Time=$(cat /proc/$process/sched | awk '{if ($1 == "avg_atom") print $3 }')
fi
done | sort -t '=' -nk3 > out5