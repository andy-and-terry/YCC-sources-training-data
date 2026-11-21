#!/usr/bin/env bash
# Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
is_bouncy() {
  local n=$1 i inc=1 dec=1
  for ((i = 1; i < ${#n}; i++)); do
    ((${n:i-1:1} > ${n:i:1})) && inc=0
    ((${n:i-1:1} < ${n:i:1})) && dec=0
  done
  ((!inc && !dec))
}

count=0
for ((n = 1; n < 1000; n++)); do
  is_bouncy "$n" && ((count++))
done
echo "$count"
