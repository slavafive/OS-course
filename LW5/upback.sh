#!/bin/bash

a=$(ls /home/user | grep "Backup.*" | sort -r | head -n 1)
for i in $(ls /home/user/$a | grep -v '.*\.*[0-9].*[0-9].*[0-9]' )
do
cp /home/user/$a/$i /home/user/restore/$i
done
