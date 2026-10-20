#!/usr/bin/env bash
set -euo pipefail

a=(apple banana cherry date)
echo "${a[1]} ${a[-1]} ${#a[@]} ${a[@]:1:2}"
a+=(elder)
a[10]=far
echo "${!a[@]}"
for i in "${!a[@]}"; do printf '%s ' "$i"; done; echo
b=("${a[@]/a/A}")
echo "${b[*]}"
unset 'a[10]'
echo "${#a[@]}"
IFS=, read -ra parts <<< "x,y,z"
echo "${parts[2]}"
