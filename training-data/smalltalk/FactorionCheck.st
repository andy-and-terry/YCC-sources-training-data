Object subclass: FactorionCheck [
    FactorionCheck class >> isFactorion: n [
        | sum |
        sum := 0.
        n printString do: [:ch | sum := sum + ch digitValue factorial].
        ^sum = n
    ]
]

| found |
found := (1 to: 49999) select: [:n | FactorionCheck isFactorion: n].
Transcript showCr: found printString.
