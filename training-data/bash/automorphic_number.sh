#!/usr/bin/env bash
is_automorphic() {
  local n=$1 sq=$(($1 * $1))
  [[ $sq == *"$n" ]]
}

for ((n = 1; n < 1000; n++)); do
  is_automorphic "$n" && printf '%d ' "$n"
done
echo
