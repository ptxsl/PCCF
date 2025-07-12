#!/bin/bash

cat boe/temp-txt.txt | grep -v "^$" | grep -v "Criterios de evaluaci" | while read line; do


    rc=0
    echo $line| grep -q "^[1-9]"|| rc=1
    if [ $rc -eq 0 ]; then
        RAT=$(echo $line |cut -d '.' -f2-)
        RAN=$(echo $line |cut -d '.' -f1)
        echo "\"RA0$RAN\": {
                    \"Resultado\": \"$RAT"\","
                        \"CriteriosEvaluacion\": {"
    else
        linea=$(echo $line | sed -e "s%^%\"%g;s%)%\": \"%g;s%$%\",%g;s%\": \"%\": \"%g;s% Se%Se%g")
        echo -e "\t\t\t\t"$linea

    fi

done
echo -e "\t\t\t\t}\n\t}\n"
