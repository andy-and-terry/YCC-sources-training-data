#!/usr/bin/env bash
set -euo pipefail

step() {
  local n=$1 s=0 d
  while ((n > 0)); do
    d=$((n % 10))
    ((s += d * d, n /= 10))
  done
  echo "$s"
}

is_happy() {
  local n=$1
  declare -A seen=()
  while ((n != 1)) && [[ -z ${seen[$n]:-} ]]; do
    seen[$n]=1
    n=$(step "$n")
  done
  ((n == 1))
}

happy=()
for i in {1..50}; do is_happy "$i" && happy+=("$i"); done
echo "${happy[*]}"
