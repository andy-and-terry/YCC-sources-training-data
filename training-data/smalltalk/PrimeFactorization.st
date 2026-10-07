Object subclass: PrimeFactors [
    PrimeFactors class >> of: anInteger [
        | n d factors |
        n := anInteger.
        d := 2.
        factors := OrderedCollection new.
        [ n > 1 ] whileTrue: [
            [ n \\ d = 0 ] whileTrue: [ factors add: d. n := n // d ].
            d := d + 1.
            d * d > n ifTrue: [ n > 1 ifTrue: [ factors add: n. n := 1 ] ] ].
        ^factors
    ]
]

Transcript showCr: (PrimeFactors of: 360) asArray printString.
Transcript showCr: (PrimeFactors of: 97) asArray printString.
