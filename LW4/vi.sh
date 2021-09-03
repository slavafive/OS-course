#!/bin/bash

bash vi1 &

while true; do
read line
case $line in
TERM)
kill -SIGTERM $(cat .pid)
exit 0;
;;
*)
:
;;
esac
done

