#!/usr/bin/env bash
set -euo pipefail

is_pangram() {
  local letters
  letters=$(tr '[:upper:]' '[:lower:]' <<<"$1" | tr -cd 'a-z' | fold -w1 | sort -u | wc -l)
  ((letters == 26))
}

for s in "The quick brown fox jumps over the lazy dog" "Hello world"; do
  is_pangram "$s" && echo "pangram: $s" || echo "not a pangram: $s"
done
