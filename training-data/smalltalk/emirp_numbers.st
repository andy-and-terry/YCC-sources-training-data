"Emirps: primes whose digit reversal is a different prime."
| isPrime out |
isPrime := [ :n |
    n >= 2 and: [ (2 to: n sqrtFloor) allSatisfy: [ :d | n \\ d ~= 0 ] ] ].
out := (2 to: 199) select: [ :n |
    | r |
    r := n printString reverse asNumber.
    r ~= n and: [ (isPrime value: n) and: [ isPrime value: r ] ] ].
Transcript showCr: (out inject: '' into: [ :acc :x | acc, x printString, ' ' ]) trimSeparators.
