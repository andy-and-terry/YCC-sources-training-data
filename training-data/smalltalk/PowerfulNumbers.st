Object subclass: PowerfulNumbers [
    PowerfulNumbers class >> isPowerful: value [
        | n p |
        n := value. p := 2.
        [p * p <= n] whileTrue: [
            n \\ p = 0 ifTrue: [
                n \\ (p * p) = 0 ifFalse: [^false].
                [n \\ p = 0] whileTrue: [n := n // p]].
            p := p + 1].
        ^n = 1
    ]
]

| found |
found := (1 to: 100) select: [:n | PowerfulNumbers isPowerful: n].
Transcript showCr: found printString.
