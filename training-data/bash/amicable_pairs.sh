#!/usr/bin/env bash
# Amicable pairs: d(a) == b and d(b) == a with a != b.
d() {
  local n=$1 s=0 i
  for ((i = 1; i < n; i++)); do
    (( n % i == 0 )) && s=$((s + i))
  done
  echo "$s"
}

for ((a = 2; a < 1500; a++)); do
  b=$(d "$a")
  if (( b > a )) && [[ $(d "$b") -eq $a ]]; then
    echo "$a $b"
  fi
done
