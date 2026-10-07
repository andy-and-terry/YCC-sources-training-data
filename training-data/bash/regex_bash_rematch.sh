#!/usr/bin/env bash
set -euo pipefail

# Use [[ =~ ]] and BASH_REMATCH to extract capture groups.
date_re='^([0-9]{4})-([0-9]{2})-([0-9]{2})$'

for s in "2024-03-15" "15/03/2024"; do
    if [[ $s =~ $date_re ]]; then
        echo "$s -> year=${BASH_REMATCH[1]} month=${BASH_REMATCH[2]} day=${BASH_REMATCH[3]}"
    else
        echo "$s -> no match"
    fi
done
