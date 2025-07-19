#!/bin/bash

cat boe/temp-txt.txt | grep -v "^$" |  while read line; do

    echo \"$line\", | sed -e "s%)%\" : \"%g"

done
