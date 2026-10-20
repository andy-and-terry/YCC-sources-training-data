#!/usr/bin/env bash
# Bash 4+ associative arrays: word frequency and key iteration.
declare -A freq
for word in red blue red green blue red; do
  freq[$word]=$(( ${freq[$word]:-0} + 1 ))
done

for key in "${!freq[@]}"; do
  echo "$key ${freq[$key]}"
done | sort

echo "keys: ${#freq[@]}"
[[ -v freq[red] ]] && echo "red present"
unset 'freq[red]'
echo "after unset: ${#freq[@]}"
