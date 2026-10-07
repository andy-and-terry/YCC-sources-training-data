#!/usr/bin/env bash
set -euo pipefail

phi() {
    local n=$1 r=$1 p
    for ((p = 2; p * p <= n; p++)); do
        if ((n % p == 0)); then
            while ((n % p == 0)); do n=$((n / p)); done
            r=$((r - r / p))
        fi
    done
    ((n > 1)) && r=$((r - r / n))
    echo "$r"
}

# Sieve version for 1..N.
N=20
sieve=()
for ((i = 0; i <= N; i++)); do sieve[i]=$i; done
for ((p = 2; p <= N; p++)); do
    ((sieve[p] == p)) || continue
    for ((k = p; k <= N; k += p)); do sieve[k]=$((sieve[k] - sieve[k] / p)); done
done

out=()
for ((i = 1; i <= N; i++)); do out+=("$(phi "$i")"); done
echo "${out[*]}"
echo "${sieve[*]:1}"
echo "phi(1000000007) = $(phi 1000000007)"
