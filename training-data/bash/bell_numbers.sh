#!/usr/bin/env bash
# Bell numbers via the Bell triangle.
row=(1)
printf '%s ' "${row[0]}"
for _ in {1..9}; do
  next=("${row[$((${#row[@]}-1))]}")
  for x in "${row[@]}"; do
    next+=($(( next[${#next[@]}-1] + x )))
  done
  row=("${next[@]}")
  printf '%s ' "${row[0]}"
done
echo
