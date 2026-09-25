#!/usr/bin/env bash
set -euo pipefail

abbreviate() {
  local out="" word
  for word in ${1//-/ }; do
    word=${word//[^A-Za-z]/}
    [[ -n $word ]] && out+=${word:0:1}
  done
  echo "${out^^}"
}

abbreviate "Portable Network Graphics"
abbreviate "Complementary metal-oxide semiconductor"
