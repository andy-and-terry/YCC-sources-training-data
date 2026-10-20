#!/usr/bin/env bash
set -euo pipefail

csv=$'id,name,score\n1,ada,90\n2,bob,75'
while IFS=, read -r id name score; do
  [[ $id == id ]] && continue
  printf '%s:%s:%s\n' "$id" "${name^}" "$score"
done <<< "$csv"
total=0
while IFS=, read -r _ _ s; do [[ $s =~ ^[0-9]+$ ]] && total=$((total + s)); done <<< "$csv"
echo "$total"
mapfile -t lines <<< "$csv"
echo "${#lines[@]}"
