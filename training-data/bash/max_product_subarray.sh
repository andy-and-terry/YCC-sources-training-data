#!/usr/bin/env bash
set -euo pipefail

max_product() {
  local best=$1 hi=$1 lo=$1 x a b t
  shift
  for x in "$@"; do
    if ((x < 0)); then t=$hi; hi=$lo; lo=$t; fi
    a=$((hi * x)); b=$((lo * x))
    hi=$((x > a ? x : a))
    lo=$((x < b ? x : b))
    best=$((best > hi ? best : hi))
  done
  echo "$best"
}

max_product 2 3 -2 4
max_product -2 0 -1
max_product -2 3 -4
