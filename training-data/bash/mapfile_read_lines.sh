#!/usr/bin/env bash
mapfile -t lines < <(printf 'one\ntwo\nthree\n')
for i in "${!lines[@]}"; do
  echo "$i: ${lines[$i]}"
done
