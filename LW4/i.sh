#!/bin/bash

cd /home
mkdir test && echo "catalog test was created successfully" > report && echo "" > /home/test/"$(date)"

https_proxy=""

ping www.net_nikogo.ru 2>>report
echo "" >> report
