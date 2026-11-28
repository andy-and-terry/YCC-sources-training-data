Object subclass: TwinPrimes [
    TwinPrimes class >> isPrime: n [
        n < 2 ifTrue: [^false].
        2 to: n sqrtFloor do: [:d | (n \\ d) = 0 ifTrue: [^false]].
        ^true
    ]
    TwinPrimes class >> upTo: limit [
        ^(3 to: limit - 2)
            select: [:p | (self isPrime: p) and: [self isPrime: p + 2]]
            thenCollect: [:p | p -> (p + 2)]
    ]
]

(TwinPrimes upTo: 50) printNl.
