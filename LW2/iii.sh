#!/bin/bash

IFS=$'\n'

for email in $(grep -Eiorh "[A-Za-z0-9][A-Za-z0-9._%+-]+@[A-Za-z0-9][A-Za-z0-9.-]+\.[A-Za-z]{2-6}" /etc)
do
  echo -n $email", "
done > emails.lst

