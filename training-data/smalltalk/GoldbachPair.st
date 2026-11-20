"Goldbach pair."
| isPrime n |
isPrime := [:k | k > 1 and: [(2 to: k sqrt floor) allSatisfy: [:d | k \\ d ~= 0]]].
n := 28.
(2 to: n // 2) detect: [:p | (isPrime value: p) and: [isPrime value: n - p]]
    ifFound: [:p | Transcript showCr: p printString, ' + ', (n - p) printString].
