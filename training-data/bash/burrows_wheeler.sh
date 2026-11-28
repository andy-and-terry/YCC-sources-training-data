#!/usr/bin/env bash
s='banana$'; n=${#s}
rots=()
for ((i=0; i<n; i++)); do rots+=("${s:i}${s:0:i}"); done
sorted=$(printf '%s\n' "${rots[@]}" | LC_ALL=C sort)
out=""
while IFS= read -r r; do out+="${r: -1}"; done <<< "$sorted"
echo "$out"
