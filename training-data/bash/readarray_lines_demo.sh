#!/usr/bin/env bash
set -euo pipefail

# readarray (alias of mapfile) loads lines into an indexed array.
readarray -t lines < <(printf '%s\n' alpha beta gamma delta)
echo "count: ${#lines[@]}"
echo "last:  ${lines[-1]}"

# -n limits how many lines are read, -s skips leading lines
readarray -t -n 2 first_two < <(printf '%s\n' one two three)
echo "first two: ${first_two[*]}"

readarray -t -s 2 rest < <(printf '%s\n' one two three four)
echo "after skipping 2: ${rest[*]}"

# Null-delimited input keeps filenames with spaces intact
readarray -d '' -t names < <(printf 'a b\0c\0')
printf '[%s]\n' "${names[@]}"
