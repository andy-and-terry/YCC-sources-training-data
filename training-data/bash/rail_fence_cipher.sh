#!/usr/bin/env bash
encrypt() {
  local text=$1 k=$2 i r out="" cycle
  cycle=$(( 2 * (k - 1) ))
  local -a rails=()
  for (( i = 0; i < ${#text}; i++ )); do
    r=$(( i % cycle ))
    (( r < k )) || r=$(( cycle - r ))
    rails[r]+=${text:i:1}
  done
  for (( r = 0; r < k; r++ )); do out+=${rails[r]}; done
  echo "$out"
}
encrypt WEAREDISCOVERED 3
