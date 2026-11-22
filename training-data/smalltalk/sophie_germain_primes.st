"Sophie Germain primes: p prime and 2p + 1 prime."
| isPrime out |
isPrime := [ :n |
    n >= 2 and: [ (2 to: n sqrtFloor) allSatisfy: [ :d | n \\ d ~= 0 ] ] ].
out := (2 to: 99) select: [ :p | (isPrime value: p) and: [ isPrime value: 2 * p + 1 ] ].
Transcript showCr: (out inject: '' into: [ :acc :x | acc, x printString, ' ' ]) trimSeparators.
