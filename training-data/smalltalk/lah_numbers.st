"Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5)."
| n out |
n := 5.
out := (1 to: n) collect: [ :k |
    ((n - 1) binomial: k - 1) * n factorial // k factorial ].
Transcript showCr: (out inject: '' into: [ :acc :x | acc, x printString, ' ' ]) trimSeparators.
