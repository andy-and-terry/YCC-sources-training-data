#!/usr/bin/env bash
set -euo pipefail

factorize() {
    local n=$1 p=2 parts=() e divisors=1
    while ((p * p <= n)); do
        e=0
        while ((n % p == 0)); do n=$((n / p)); e=$((e + 1)); done
        if ((e > 0)); then
            ((e > 1)) && parts+=("$p^$e") || parts+=("$p")
            divisors=$((divisors * (e + 1)))
        fi
        ((p == 2)) && p=3 || p=$((p + 2))
    done
    ((n > 1)) && { parts+=("$n"); divisors=$((divisors * 2)); }
    local IFS='*'
    echo "${parts[*]} ($divisors divisors)" | sed 's/\*/ * /g'
}

for n in 360 97 1001 600851475143 1048576; do echo "$n = $(factorize "$n")"; done
echo "coreutils factor: $(factor 600851475143)"
