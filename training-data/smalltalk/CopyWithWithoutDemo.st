| a b |
a := #(1 2 3 2 1).

b := a copyWith: 9.
Transcript showCr: b printString.
Transcript showCr: (a copyWithout: 2) printString.
Transcript showCr: (a , #(7 8)) printString.
Transcript showCr: a reverse printString.
Transcript showCr: (a copyFrom: 2 to: 4) printString.
Transcript showCr: (a copyReplaceAll: #(2) with: #(0 0)) printString.
Transcript showCr: a printString.
Transcript showCr: (a indexOf: 3) printString.
Transcript showCr: (a asBag occurrencesOf: 2) printString.
Transcript showCr: a asSet size printString.
Transcript showCr: ('hello' copyWith: $!) printString.
