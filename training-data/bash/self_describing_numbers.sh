#!/usr/bin/env bash
is_self_describing() {
  local s=$1 i stripped
  for (( i = 0; i < ${#s}; i++ )); do
    stripped=${s//$i/}
    (( ${#s} - ${#stripped} == ${s:i:1} )) || return 1
  done
}

for s in 1210 2020 21200 1211; do
  if is_self_describing "$s"; then echo "$s true"; else echo "$s false"; fi
done
