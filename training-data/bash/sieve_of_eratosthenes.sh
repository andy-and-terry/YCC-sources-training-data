#!/usr/bin/env bash
set -euo pipefail

sieve() {
    local limit=$1
    local -a is_composite
    local primes=()
    for ((i = 2; i <= limit; i++)); do
        is_composite[i]=0
    done
    for ((i = 2; i * i <= limit; i++)); do
        if ((is_composite[i] == 0)); then
            for ((j = i * i; j <= limit; j += i)); do
                is_composite[j]=1
            done
        fi
    done
    for ((i = 2; i <= limit; i++)); do
        if ((is_composite[i] == 0)); then
            primes+=("$i")
        fi
    done
    echo "${primes[@]}"
}

sieve 50
