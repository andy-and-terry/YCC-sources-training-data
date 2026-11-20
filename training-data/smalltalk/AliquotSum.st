"Aliquot sum classification."
#(6 12 15 28) do: [:n | | a kind |
    a := ((1 to: n - 1) select: [:d | n \\ d = 0]) inject: 0 into: [:s :d | s + d].
    kind := a = n ifTrue: ['perfect'] ifFalse: [a > n ifTrue: ['abundant'] ifFalse: ['deficient']].
    Transcript showCr: n printString, ' ', a printString, ' ', kind].
