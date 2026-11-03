#!/usr/bin/env bash
values=(3 1 4 1 5 9 2 6)
prefix=(0)
for i in "${!values[@]}"; do
  prefix[i + 1]=$((prefix[i] + values[i]))
done

query() { echo $((prefix[$2] - prefix[$1])); }

query 2 5
