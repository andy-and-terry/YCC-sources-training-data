1 to: 5 do: [:i |
    (i even)
        ifTrue: [Transcript showCr: i printString, ' even']
        ifFalse: [Transcript showCr: i printString, ' odd']].
5 to: 1 by: -2 do: [:i | Transcript show: i printString; show: ' '].
Transcript cr.
3 timesRepeat: [Transcript show: '*'].
Transcript cr.
