Object subclass: PrimeFactorization [
    PrimeFactorization class >> of: aNumber [
        | n d factors |
        n := aNumber.
        d := 2.
        factors := OrderedCollection new.
        [ d * d <= n ] whileTrue: [
            [ n \\ d = 0 ] whileTrue: [
                factors add: d.
                n := n // d ].
            d := d + 1 ].
        n > 1 ifTrue: [ factors add: n ].
        ^factors
    ]
]

Transcript showCr: (PrimeFactorization of: 360) printString.
Transcript showCr: (PrimeFactorization of: 97) printString.
Transcript showCr: (PrimeFactorization of: 1001) printString.
