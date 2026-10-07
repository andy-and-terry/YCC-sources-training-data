Object subclass: PerfectNumber [
    PerfectNumber class >> divisorSumOf: n [
        | sum |
        sum := 0.
        1 to: n // 2 do: [ :d |
            n \\ d = 0 ifTrue: [ sum := sum + d ] ].
        ^sum
    ]

    PerfectNumber class >> isPerfect: n [
        ^n > 1 and: [ (self divisorSumOf: n) = n ]
    ]
]

| perfects |
perfects := (1 to: 1000) select: [ :n | PerfectNumber isPerfect: n ].
Transcript showCr: perfects printString.
