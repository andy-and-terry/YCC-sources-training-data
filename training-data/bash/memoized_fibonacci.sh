#!/usr/bin/env bash
# Fibonacci with an associative-array memo table (result via global to avoid subshells).
declare -A memo
result=0
fib() {
    local n=$1
    if (( n < 2 )); then result=$n; return; fi
    if [[ -n ${memo[$n]:-} ]]; then result=${memo[$n]}; return; fi
    fib $((n - 1)); local a=$result
    fib $((n - 2)); local b=$result
    memo[$n]=$((a + b))
    result=${memo[$n]}
}
fib 50
echo "fib(50) = $result"
