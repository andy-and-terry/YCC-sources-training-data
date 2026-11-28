| isPrime reversed emirps |
isPrime := [:n |
    n >= 2 and: [(2 to: n sqrtFloor) allSatisfy: [:d | n \\ d ~= 0]]].
reversed := [:n | n printString reverse asNumber].

emirps := (2 to: 199) select: [:p |
    | r |
    r := reversed value: p.
    r ~= p and: [(isPrime value: p) and: [isPrime value: r]]].
Transcript showCr: emirps printString. "(13 17 31 37 71 73 79 97 107 113 149 157 167 179 199)"
