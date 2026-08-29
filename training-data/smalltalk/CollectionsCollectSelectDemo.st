| numbers doubled evens sum |
numbers := #(1 2 3 4 5).
doubled := numbers collect: [ :n | n * 2 ].
evens := numbers select: [ :n | n even ].
sum := numbers inject: 0 into: [ :acc :n | acc + n ].
Transcript showCr: doubled printString.
Transcript showCr: evens printString.
Transcript showCr: sum printString.
