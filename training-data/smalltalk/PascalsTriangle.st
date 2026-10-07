| row |
row := OrderedCollection with: 1.
6 timesRepeat: [
    Transcript showCr: (row inject: '' into: [ :acc :x | acc, x printString, ' ' ]).
    row := (0 to: row size) collect: [ :i |
        (i = 0 or: [ i = row size ])
            ifTrue: [ 1 ]
            ifFalse: [ (row at: i) + (row at: i + 1) ] ]
].
