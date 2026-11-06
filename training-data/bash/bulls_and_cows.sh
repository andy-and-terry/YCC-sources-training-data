#!/usr/bin/env bash
# Bulls and Cows scoring for equal-length digit strings.
score() {
  local secret=$1 guess=$2 bulls=0 cows=0 i
  local -A sc=() gc=()
  for ((i = 0; i < ${#secret}; i++)); do
    s=${secret:i:1}; g=${guess:i:1}
    if [[ $s == "$g" ]]; then
      bulls=$((bulls + 1))
    else
      sc[$s]=$(( ${sc[$s]:-0} + 1 ))
      gc[$g]=$(( ${gc[$g]:-0} + 1 ))
    fi
  done
  for c in "${!sc[@]}"; do
    g=${gc[$c]:-0}
    cows=$(( cows + (sc[$c] < g ? sc[$c] : g) ))
  done
  echo "$bulls bull(s), $cows cow(s)"
}

score 1807 7810
