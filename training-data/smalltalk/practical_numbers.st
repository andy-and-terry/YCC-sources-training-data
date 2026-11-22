"Practical numbers: every m in 1..n is a sum of distinct divisors of n."
| isPractical out |
isPractical := [ :n |
    | reach mask |
    reach := 1. "bit i set <=> i is a subset sum"
    (1 to: n) do: [ :d |
        n \\ d = 0 ifTrue: [ reach := reach bitOr: (reach bitShift: d) ] ].
    mask := (1 bitShift: n + 1) - 1.
    (reach bitAnd: mask) = mask ].
out := (1 to: 40) select: [ :n | isPractical value: n ].
Transcript showCr: (out inject: '' into: [ :acc :x | acc, x printString, ' ' ]) trimSeparators.
