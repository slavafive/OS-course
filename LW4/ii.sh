#!/bin/bash

at -f /home/user/lab4/i now +1 minute
(tail -n 0 -f /home/user/lab4/report) | while true; do
read LINE; 
case $LINE in
"")
kill $(echo $$)
exit 0
;;
*) 
echo $LINE
;;
esac
done
