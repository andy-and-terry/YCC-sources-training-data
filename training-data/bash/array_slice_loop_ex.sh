#!/usr/bin/env bash
arr=(a b c d e f)
echo "${arr[@]:1:3}"
for i in "${!arr[@]}"; do (( i % 2 == 0 )) && echo "${arr[i]}"; done
