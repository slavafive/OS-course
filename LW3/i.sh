#!bin/bash

ps u | sed -n '/user/p' | awk '{print $2, $11}' | sed 's/ /:/'


