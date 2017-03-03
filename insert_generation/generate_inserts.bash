#!/bin/bash

usage_advice="usage: $0 fichier.csv nom_table liste_attributs"

if [ $# -le 2 ]
then
    echo $usage_advice
    exit
fi

if [ ! -r $1 ]
then
    echo "impossible de lire $1"
    exit
else
    fichier=$1
    shift
fi

table_name=$1
shift

#traitement des attributs
while [ $# -gt 0 ]
do
    position=$(head -n 1 tableau.csv | tr ';' '\n' | grep -n "^\s*$1\s*$" | cut -f1 -d:)
    if [ -z $position ]
    then
        >2& echo "error: unmatched attribute : $1"
        exit
    fi
    awk_accumulator="$awk_accumulator, \",\", \$$position"
    shift
done

#removing the first comma. welcome to bash hell
awk_accumulator=${awk_accumulator:7:${#awk_accumulator}-1}

#doing the crazy work
awk_script="{print($awk_accumulator)}"
tail -n +2 $fichier | awk -F ';' "$awk_script" | sort -u |\
    sed -e "s/'/''/g" \
-e 's/\s\+,/,/g' \
-e "s/\([,(]\)\s*\([a-zA-Z[:digit:]][-a-zA-Z_'. [:digit:]:/]*\)/\1 '\2'/g" \
-e "s/'\([[:digit:]]\+\)'/\1/g" \
-e "s/.*/INSERT INTO $table_name Values (&);/" \
-e "s/'\([[:digit:]]\{2\}\/[[:digit:]]\{2\}\/[[:digit:]]\{4\}\)'/to_date(\1, 'DD\/MM\/YYYY')/g" \
-e "s/'\([[:digit:]]\{2\}\/[[:digit:]]\{2\}\/[[:digit:]]\{4\} [[:digit:]]\{2\}:[[:digit:]]\{2\}\)'/to_date(\1, 'DD\/MM\/YYYY HH24:MI')/g"
