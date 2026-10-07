#!/usr/bin/env bash
set -euo pipefail

# Items: name weight value. Greedy by value density; fractions computed with awk.
items=$'gold 10 60\nsilver 20 100\nbronze 30 120'
capacity=50

sort -t' ' -k4,4gr < <(awk '{ print $0, $3 / $2 }' <<<"$items") |
    awk -v cap="$capacity" '
        cap > 0 {
            take = ($2 < cap) ? $2 : cap
            cap -= take
            total += $3 * take / $2
            printf "%s x%.2f\n", $1, take / $2
        }
        END { printf "total value %g\n", total }'
