#!/usr/bin/env bash
set -euo pipefail

pig_word() {
  local w=$1
  if [[ $w =~ ^([aeiou]|xr|yt) ]]; then
    echo "${w}ay"
  elif [[ $w =~ ^([^aeiou]*qu)(.*)$ ]]; then
    echo "${BASH_REMATCH[2]}${BASH_REMATCH[1]}ay"
  elif [[ $w =~ ^([^aeiouy]+)(y.*)$ ]]; then
    echo "${BASH_REMATCH[2]}${BASH_REMATCH[1]}ay"
  elif [[ $w =~ ^([^aeiou]+)(.*)$ ]]; then
    echo "${BASH_REMATCH[2]}${BASH_REMATCH[1]}ay"
  else
    echo "${w}ay"
  fi
}

out=()
for w in quick fast run apple rhythm square; do out+=("$(pig_word "$w")"); done
echo "${out[*]}"
