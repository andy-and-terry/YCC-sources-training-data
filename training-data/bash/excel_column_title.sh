#!/usr/bin/env bash
column_title() {
  local n=$1 out=""
  while (( n > 0 )); do
    (( n-- ))
    out="$(printf "\\$(printf '%03o' $(( 65 + n % 26 )))")$out"
    (( n /= 26 ))
  done
  echo "$out"
}

column_title 28  # AB
column_title 701 # ZY
