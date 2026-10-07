#!/usr/bin/env bash
set -euo pipefail

classify() {
  local s
  read -r -a s < <(printf '%s\n' "$@" | sort -n | paste -sd' ')
  if ((s[0] <= 0 || s[0] + s[1] <= s[2])); then echo invalid; return; fi
  local unique
  unique=$(printf '%s\n' "$@" | sort -u | wc -l)
  case $unique in
    1) echo equilateral ;;
    2) echo isosceles ;;
    *) echo scalene ;;
  esac
}

for t in "3 3 3" "3 4 4" "3 4 5" "1 1 3"; do
  # shellcheck disable=SC2086
  echo "$t: $(classify $t)"
done
