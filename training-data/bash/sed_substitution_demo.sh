#!/usr/bin/env bash
set -euo pipefail

text="the quick brown fox jumps over the lazy dog"

echo "$text" | sed 's/the/THE/'
echo "$text" | sed 's/the/THE/g'
echo "$text" | sed -E 's/(quick|lazy)/[\1]/g'
echo "$text" | sed 's/\b\(.\)/\u\1/g'
echo "$text" | sed -n 's/.*\(brown [a-z]*\).*/\1/p'
printf 'a,b,c\n' | sed 'y/,/;/'
printf 'one\ntwo\nthree\n' | sed '2d'
printf 'one\ntwo\nthree\n' | sed -n '2,3p'
