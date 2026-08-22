|numbers evenSquares total|
numbers := (1 to: 10) asOrderedCollection.
evenSquares := (numbers select: [ :n | n even ]) collect: [ :n | n * n ].
total := numbers inject: 0 into: [ :acc :n | acc + n ].

Transcript showCr: evenSquares printString.
Transcript showCr: total printString.
