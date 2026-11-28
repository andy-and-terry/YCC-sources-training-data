| seq |
seq := OrderedCollection withAll: #(0 1).
2 to: 14 do: [:i |
    | h |
    h := i // 2.
    seq add: (i even
        ifTrue: [seq at: h + 1]
        ifFalse: [(seq at: h + 1) + (seq at: h + 2)])].
Transcript showCr: seq printString. "(0 1 1 2 1 3 2 3 1 4 3 5 2 5 3)"
