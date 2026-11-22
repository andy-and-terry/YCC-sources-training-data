"Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1."
| out |
out := (0 to: 9) collect: [ :n | n * (n + 1) // 2 + 1 ].
Transcript showCr: (out inject: '' into: [ :acc :x | acc, x printString, ' ' ]) trimSeparators.
