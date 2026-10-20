#!/usr/bin/env bash
set -euo pipefail

max() {
  local m=$1; shift
  for n; do (( n > m )) && m=$n; done
  echo "$m"
}
is_even() { (( $1 % 2 == 0 )); }
fact() { (( $1 <= 1 )) && { echo 1; return; }; echo $(( $1 * $(fact $(( $1 - 1 ))) )); }
echo "$(max 3 9 4) $(fact 6)"
is_even 4 && echo even
is_even 5 || echo odd
