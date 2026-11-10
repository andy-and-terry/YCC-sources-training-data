Object subclass: TwinPrimes [
    TwinPrimes class >> isPrime: n [
        n < 2 ifTrue: [^false].
        2 to: n sqrt floor do: [:d | n \\ d = 0 ifTrue: [^false]].
        ^true
    ]

    TwinPrimes class >> pairsUpTo: limit [
        | pairs |
        pairs := OrderedCollection new.
        3 to: limit - 2 do: [:p |
            ((self isPrime: p) and: [self isPrime: p + 2]) ifTrue: [pairs add: p -> (p + 2)]].
        ^pairs
    ]
]

(TwinPrimes pairsUpTo: 80) printNl.   "(3->5 5->7 11->13 17->19 29->31 41->43 59->61 71->73 )"
