#!/bin/bash

cat boe/temp-txt.txt | grep -v "^$" |  while read line; do

    linea=$(echo $line | sed -e "s%)%\" : \"%g"| sed 's/^[0-9]\+\.\s*//')
    echo \"$linea\",

done
