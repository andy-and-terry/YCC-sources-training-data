Object subclass: Gcd [
    Gcd class >> of: a and: b [
        | x y temp |
        x := a.
        y := b.
        [ y ~= 0 ] whileTrue: [
            temp := y.
            y := x \\ y.
            x := temp.
        ].
        ^x
    ]
]

Transcript showCr: (Gcd of: 48 and: 18) printString.
Transcript showCr: (Gcd of: 100 and: 75) printString.
