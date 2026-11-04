#!/usr/bin/env bash
ordinal() {
  local n=$1 s=th
  if ((n % 100 < 11 || n % 100 > 13)); then
    case $((n % 10)) in 1) s=st ;; 2) s=nd ;; 3) s=rd ;; esac
  fi
  echo "$n$s"
}

for n in 1 2 3 4 11 12 13 21 101 111; do printf '%s ' "$(ordinal "$n")"; done; echo
