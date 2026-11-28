#!/bin/bash
is_pronic() {
    local x=$1 n=0
    while (( (n + 1) * (n + 1) <= x )); do n=$((n + 1)); done
    (( n * (n + 1) == x ))
}

for ((n = 0; n < 10; n++)); do printf '%s ' $((n * (n + 1))); done
echo # 0 2 6 12 20 30 42 56 72 90
is_pronic 56 && echo "56 yes"
is_pronic 57 || echo "57 no"
