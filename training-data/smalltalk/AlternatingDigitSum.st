Object subclass: AlternatingDigitSum [
    AlternatingDigitSum class >> of: value [
        | n total sign |
        n := value. total := 0. sign := 1.
        [n > 0] whileTrue: [
            total := total + (sign * (n \\ 10)).
            sign := sign negated.
            n := n // 10].
        ^total
    ]
]

#(1234 99999 1000) do: [:n |
    Transcript showCr: n printString, ' ', (AlternatingDigitSum of: n) printString].
