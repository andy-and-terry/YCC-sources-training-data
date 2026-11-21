#!/usr/bin/env bash
# Amicable pairs below 1500 via sums of proper divisors.
s() {
  local n=$1 t=0 d
  for ((d = 1; d < n; d++)); do
    ((n % d == 0)) && ((t += d))
  done
  echo "$t"
}

for ((a = 2; a < 1500; a++)); do
  b=$(s "$a")
  if ((b > a)) && (($(s "$b") == a)); then
    echo "$a $b"
  fi
done
