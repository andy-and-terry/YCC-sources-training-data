"Twin primes: pairs (p, p+2) both prime; print the lesser of each pair."
| isPrime out |
isPrime := [ :n |
    n >= 2 and: [ (2 to: n sqrtFloor) allSatisfy: [ :d | n \\ d ~= 0 ] ] ].
out := (2 to: 99) select: [ :p | (isPrime value: p) and: [ isPrime value: p + 2 ] ].
Transcript showCr: (out inject: '' into: [ :acc :x | acc, x printString, ' ' ]) trimSeparators.
