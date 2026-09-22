| words counts uniqueWords bag |
words := #('apple' 'banana' 'apple' 'cherry' 'banana' 'apple').

counts := Dictionary new.
words do: [ :w | counts at: w put: (counts at: w ifAbsent: [ 0 ]) + 1 ].
Transcript showCr: (counts at: 'apple') printString.

uniqueWords := Set new.
words do: [ :w | uniqueWords add: w ].
Transcript showCr: uniqueWords size printString.

bag := Bag new.
words do: [ :w | bag add: w ].
Transcript showCr: (bag occurrencesOf: 'banana') printString.
