| isPrime rev out |
isPrime := [:n | n >= 2 and: [(2 to: n sqrtFloor) allSatisfy: [:i | n \\ i ~= 0]]].
rev := [:n | n printString reverse asNumber].
out := (2 to: 99) select: [:p |
    (isPrime value: p) and: [(rev value: p) ~= p and: [isPrime value: (rev value: p)]]].
Transcript showCr: out printString.
