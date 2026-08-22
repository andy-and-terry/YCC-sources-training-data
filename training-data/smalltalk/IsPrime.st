Object subclass: IsPrime [
    IsPrime class >> test: n [
        | i |
        n < 2 ifTrue: [ ^false ].
        i := 2.
        [ i * i <= n ] whileTrue: [
            (n \\ i = 0) ifTrue: [ ^false ].
            i := i + 1.
        ].
        ^true
    ]
]

Transcript showCr: ((2 to: 20) select: [ :n | IsPrime test: n ]) printString.
