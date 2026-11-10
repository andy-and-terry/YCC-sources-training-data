Object subclass: SophieGermainPrimes [
    SophieGermainPrimes class >> isPrime: n [
        n < 2 ifTrue: [^false].
        2 to: n sqrt floor do: [:d | n \\ d = 0 ifTrue: [^false]].
        ^true
    ]

    SophieGermainPrimes class >> first: count [
        | out p |
        out := OrderedCollection new.
        p := 2.
        [out size < count] whileTrue: [
            ((self isPrime: p) and: [self isPrime: 2 * p + 1]) ifTrue: [out add: p].
            p := p + 1].
        ^out
    ]
]

(SophieGermainPrimes first: 10) printNl.   "OrderedCollection (2 3 5 11 23 29 41 53 83 89)"
