"Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1."
| r out |
r := 0.
out := (1 to: 8) collect: [ :i | r := r * 10 + 1 ].
Transcript showCr: (out inject: '' into: [ :acc :x | acc, x printString, ' ' ]) trimSeparators.
