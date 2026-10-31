Object subclass: SphenicNumbers [
    SphenicNumbers class >> isSphenic: value [
        | n p distinct |
        n := value. p := 2. distinct := 0.
        [p * p <= n] whileTrue: [
            n \\ p = 0 ifTrue: [
                n := n // p.
                n \\ p = 0 ifTrue: [^false].
                distinct := distinct + 1].
            p := p + 1].
        n > 1 ifTrue: [distinct := distinct + 1].
        ^distinct = 3
    ]
]

| found |
found := (2 to: 79) select: [:n | SphenicNumbers isSphenic: n].
Transcript showCr: found printString.
