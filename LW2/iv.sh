#!/bin/bash

grep -rh '^#!/bin/.*sh' /bin > file

awk '{++a[$0]}END{for(i in a)if(a[i]>max){max=a[i];k=i}print k}' file

rm file
