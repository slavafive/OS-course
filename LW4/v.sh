#!/bin/bash

echo $$ > data

bash v1 &

while true; do
read LINE
echo "$LINE" >> data
if [[ "$LINE" = "quit" ]]
then
kill $$
fi
done
