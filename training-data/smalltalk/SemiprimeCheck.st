Object subclass: SemiprimeCheck [
    SemiprimeCheck class >> primeFactorCount: value [
        | n p count |
        n := value. p := 2. count := 0.
        [p * p <= n] whileTrue: [
            [n \\ p = 0] whileTrue: [n := n // p. count := count + 1].
            p := p + 1].
        n > 1 ifTrue: [count := count + 1].
        ^count
    ]
]

| found |
found := (2 to: 29) select: [:n | (SemiprimeCheck primeFactorCount: n) = 2].
Transcript showCr: found printString.
