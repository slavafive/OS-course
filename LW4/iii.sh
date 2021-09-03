#!/bin/bash

2>/dev/null

crontab -l | { cat; echo "*/5 * * * 1 /home/user/lab4/i"; } | crontab -
