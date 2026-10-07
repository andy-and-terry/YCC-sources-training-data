| bag words counts |
bag := Bag new.
bag add: 'apple'; add: 'pear'; add: 'apple'; add: 'fig' withOccurrences: 3.
Transcript showCr: (bag occurrencesOf: 'apple') printString.
Transcript showCr: (bag occurrencesOf: 'fig') printString.
Transcript showCr: bag size printString.
Transcript showCr: bag asSet size printString.

words := 'the cat and the hat and the bat' substrings: ' '.
counts := Dictionary new.
words do: [:w | counts at: w put: (counts at: w ifAbsent: [0]) + 1].
(counts keys asSortedCollection) do: [:k |
    Transcript showCr: k, ' -> ', (counts at: k) printString].
Transcript showCr: (counts keyAtValue: 3) printString.
Transcript showCr: (counts includesKey: 'dog') printString.
