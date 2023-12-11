#!/bin/bash
# +---------------------------------------------------------------------------+
# @author: nanselm
# contact: nanselm@awi.de || jejune@posteo.net
# name: hausaufgabe.sh
# purpose: doing hausaufgabe
# comments: <!-- no comment -->
# +---------------------------------------------------------------------------+

if [[ "$#" -eq "0" ]]; then
    echo -e "\n put file here:\n\n"
    exit 1
else
    :
fi

newname="2023-12-01-Dates_and_ISSNs.tsv"

# ISSN
grep -Eo --color "[^. ][0-9]{4}-[0-9X]{4}|(ISSN|issn|Issn):\s{0,2}[0-9]{4}-[0-9X]{4}" $1 | sed 's/[ISNisn: \t]//g'  > t1
# YYYY
grep -Eo --color "[^- |^\( |^A-Z0-9 ][1-9]{4}[^-]|[0-9]{4}$" $1 | sed 's/\t//g' > t2

# to stdout
paste t1 t2 | column -s $'\t' -t  | sort | uniq
##
## END OF FILE
