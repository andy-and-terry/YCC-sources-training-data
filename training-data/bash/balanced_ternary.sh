#!/usr/bin/env bash
# Integer -> balanced ternary string using '-', '0', '+'.
to_bt() {
  local n=$1 out="" r
  (( n == 0 )) && { echo 0; return; }
  while (( n != 0 )); do
    r=$(( ((n % 3) + 3) % 3 ))
    case $r in
      0) out="0$out" ;;
      1) out="+$out"; ((n--)) ;;
      2) out="-$out"; ((n++)) ;;
    esac
    n=$(( n / 3 ))
  done
  echo "$out"
}
for k in -14 -1 0 5 42; do echo "$k $(to_bt "$k")"; done
