#!/usr/bin/env bash
# Reverse-and-add until a palindrome; count the steps.
reverse_digits() { echo "$1" | rev; }

steps() {
  local n=$1 count
  for ((count = 0; count < 50; count++)); do
    if ((count > 0)) && [[ $n == "$(reverse_digits "$n")" ]]; then echo "$count"; return; fi
    n=$((n + $(reverse_digits "$n")))
  done
  echo -1
}

out=()
for n in 56 57 59 79 89; do out+=("$(steps "$n")"); done
echo "${out[*]}"
