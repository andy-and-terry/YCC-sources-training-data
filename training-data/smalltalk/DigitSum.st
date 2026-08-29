Object subclass: DigitSum [
    DigitSum class >> sumOf: n [
        | total num |
        total := 0.
        num := n.
        [ num > 0 ] whileTrue: [
            total := total + (num \\ 10).
            num := num // 10.
        ].
        ^total
    ]
]

Transcript showCr: (DigitSum sumOf: 12345) printString.
