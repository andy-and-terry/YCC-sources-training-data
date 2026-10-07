#!/usr/bin/env bash
set -euo pipefail

is_isogram() {
  local letters dups
  letters=$(tr '[:upper:]' '[:lower:]' <<<"$1" | tr -cd 'a-z' | fold -w1)
  dups=$(sort <<<"$letters" | uniq -d)
  [[ -z $dups ]]
}

for w in lumberjacks background six-year-old isograms; do
  is_isogram "$w" && echo "$w yes" || echo "$w no"
done
