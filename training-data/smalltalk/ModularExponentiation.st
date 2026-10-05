Object subclass: ModularExponentiation [
    ModularExponentiation class >> base: b exp: e mod: m [
        | result base exponent |
        result := 1.
        base := b \\ m.
        exponent := e.
        [ exponent > 0 ] whileTrue: [
            exponent odd ifTrue: [ result := (result * base) \\ m ].
            base := (base * base) \\ m.
            exponent := exponent // 2.
        ].
        ^result
    ]
]

Transcript showCr: (ModularExponentiation base: 2 exp: 10 mod: 1000) printString.
Transcript showCr: (ModularExponentiation base: 3 exp: 200 mod: 13) printString.
Transcript showCr: (ModularExponentiation base: 7 exp: 1000000005 mod: 1000000007) printString.
