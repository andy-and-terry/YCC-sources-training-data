#!/usr/bin/env bash
# Spell out integers from 0 to 999.
ones=(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
tens=("" "" twenty thirty forty fifty sixty seventy eighty ninety)
words() {
    local n=$1
    if (( n < 20 )); then
        echo "${ones[n]}"
    elif (( n < 100 )); then
        if (( n % 10 )); then echo "${tens[n/10]}-${ones[n%10]}"
        else echo "${tens[n/10]}"; fi
    elif (( n % 100 )); then
        echo "${ones[n/100]} hundred $(words $((n % 100)))"
    else
        echo "${ones[n/100]} hundred"
    fi
}
for n in 0 13 40 57 100 342 999; do echo "$n: $(words $n)"; done
