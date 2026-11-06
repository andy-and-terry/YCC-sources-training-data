#!/usr/bin/env bash
# Integer (1..3999) to Roman numeral using a greedy table.
values=(1000 900 500 400 100 90 50 40 10 9 5 4 1)
symbols=(M CM D CD C XC L XL X IX V IV I)

to_roman() {
  local n=$1 out="" i
  for i in "${!values[@]}"; do
    while (( n >= values[i] )); do
      out+=${symbols[i]}
      n=$((n - values[i]))
    done
  done
  echo "$out"
}

echo "$(to_roman 1994) $(to_roman 58)"
