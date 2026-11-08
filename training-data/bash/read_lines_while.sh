#!/usr/bin/env bash
printf 'alice 30\nbob 25\ncarol 41\n' | while read -r name age; do
  if (( age > 28 )); then
    echo "$name is over 28"
  fi
done
