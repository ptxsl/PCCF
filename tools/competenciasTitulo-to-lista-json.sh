#!/bin/bash

cat ./boe/temp-txt.txt | sed -e "s% y %, %g"| sed -e "s%)%%g"| sed -e "s%^%\"%g"| sed -e "s%$%\"%g"| sed -e "s%,%\",\"%g"|sed -e "s% %%g"

exit 0
