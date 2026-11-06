"Emirps: primes whose digit reversal is a different prime."
| isPrime emirps |
isPrime := [:n |
    n >= 2 and: [(2 to: n sqrtFloor) allSatisfy: [:i | n \\ i ~= 0]]].
emirps := (2 to: 99) select: [:n | | r |
    r := n printString reverse asNumber.
    r ~= n and: [(isPrime value: n) and: [isPrime value: r]]].
Transcript showCr: emirps printString.
