#!/usr/bin/env bash

# automation script to remove all the files I don't use from the entirety of reveal.js
# as of today 2017-12-13. The list of files which will be KEPT is read from KEEPFILES

# Load text file lines into a bash array.
OLD_IFS=$IFS
IFS=$'\n'
keep=( $(cat "./KEEPFILES") )
IFS=$OLD_IFS

echo "---------- FILES TO KEEP ----------"
# Print each line in the array.
for idx in $(seq 0 $((${#keep[@]} - 1))); do
    line="${keep[$idx]}"
    printf "${line}\n"
done

echo "------------ CLEANING ------------"
find ./ -type f -maxdepth 1 $(printf "! -name %s " ${keep[*]}) \
       -exec rm {} \;


