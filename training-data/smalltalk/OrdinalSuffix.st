| ordinal |
ordinal := [:n | | r100 r10 |
    r100 := n \\ 100. r10 := n \\ 10.
    n printString, ((r100 between: 11 and: 13)
        ifTrue: ['th']
        ifFalse: [r10 = 1 ifTrue: ['st'] ifFalse: [r10 = 2 ifTrue: ['nd'] ifFalse: [r10 = 3 ifTrue: ['rd'] ifFalse: ['th']]]])].
#(1 2 3 4 11 12 13 21 101 111) do: [:n | Transcript show: (ordinal value: n); show: ' '].
Transcript cr.
