#!/usr/bin/env bash
set -euo pipefail

sum_squares() {
    local total=0 n
    for n in "$@"; do
        ((total += n * n))
    done
    echo "$total"
}

echo "sum of squares 1..5: $(sum_squares 1 2 3 4 5)"
echo "sum of squares 1..10: $(sum_squares {1..10})"
