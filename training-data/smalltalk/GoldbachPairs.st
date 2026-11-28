Object subclass: GoldbachPairs [
    GoldbachPairs class >> isPrime: n [
        n < 2 ifTrue: [^false].
        2 to: n sqrtFloor do: [:d | (n \\ d) = 0 ifTrue: [^false]].
        ^true
    ]
    GoldbachPairs class >> pairsFor: n [
        ^((2 to: n // 2) select: [:p | (self isPrime: p) and: [self isPrime: n - p]])
            collect: [:p | p -> (n - p)]
    ]
]

(GoldbachPairs pairsFor: 28) printNl.
