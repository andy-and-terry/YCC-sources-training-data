#!/usr/bin/env bash
# echo -n, -e and why printf is safer.
echo -n "no newline|"
echo " next"
echo -e "tab:\there\nnewline above"
printf '%s\n' "-n is treated as data by printf"
