#!bin/bash

ps u  | awk ' {print $2,$9} ' | sort -nk2 | tail -n2 | head -n1
