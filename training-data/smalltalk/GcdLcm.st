Object subclass: GcdLcm [
    GcdLcm class >> gcdOf: a and: b [
        | x y t |
        x := a. y := b.
        [ y ~= 0 ] whileTrue: [
            t := y.
            y := x \\ y.
            x := t.
        ].
        ^x abs
    ]
    GcdLcm class >> lcmOf: a and: b [
        ^(a * b) abs // (self gcdOf: a and: b)
    ]
]

Transcript showCr: (GcdLcm gcdOf: 48 and: 18) printString.
Transcript showCr: (GcdLcm lcmOf: 4 and: 6) printString.
