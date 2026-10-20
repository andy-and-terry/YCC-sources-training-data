#!/usr/bin/env bash
set -euo pipefail

a=0 b=1
for _ in {1..12}; do printf '%d ' "$a"; (( t = a + b, a = b, b = t )); done; echo
is_prime() { local n=$1; (( n < 2 )) && return 1; for ((d = 2; d * d <= n; d++)); do (( n % d == 0 )) && return 1; done; return 0; }
for n in {1..30}; do is_prime "$n" && printf '%d ' "$n"; done; echo
