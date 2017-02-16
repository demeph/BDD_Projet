#!/bin/bash

#http://stackoverflow.com/questions/2129123/rearrange-columns-using-cut
usage_advice="usage: $0 fichier.csv liste_attributs"

if [ $# -le 1 ]
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

while [ $# -gt 0 ]
do
    position=$(head -n 1 tableau.csv | tr ';' '\n' | grep -n $1 | cut -f1 -d:)
    echo $1 en position $position
    accumulator="$accumulator,$position"
    shift
done
#removing the first comma. welcome to bash hell
accumulator=${accumulator:1:${#accumulator}-1}

tail -n +1 $fichier | cut -d ';' -f $accumulator | sort -u

echo "all done : $accumulator"
