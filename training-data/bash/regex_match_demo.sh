#!/usr/bin/env bash
# Regex matching with [[ =~ ]] and BASH_REMATCH capture groups.
date_re='^([0-9]{4})-([0-9]{2})-([0-9]{2})$'
for d in 2024-05-17 17/05/2024; do
    if [[ $d =~ $date_re ]]; then
        echo "$d -> year=${BASH_REMATCH[1]} month=${BASH_REMATCH[2]} day=${BASH_REMATCH[3]}"
    else
        echo "$d -> no match"
    fi
done
