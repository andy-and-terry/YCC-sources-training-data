#!/usr/bin/env bash
data=$'name,age\nann,30\nbob,25'
total=0
while IFS=, read -r name age; do
  [[ $name == name ]] && continue
  printf '%-5s %3d\n' "$name" "$age"
  total=$((total + age))
done <<< "$data"
echo "total=$total"
