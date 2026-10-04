| a b c |
a := #(10 20 30 40 50).

Transcript showCr: (a copyFrom: 2 to: 4) printString.
Transcript showCr: (a copyWith: 60) printString.
Transcript showCr: (a copyWithout: 30) printString.
Transcript showCr: (a , #(1 2)) printString.
Transcript showCr: a reverse printString.
Transcript showCr: (a first: 2) printString.
Transcript showCr: (a last: 2) printString.
Transcript showCr: (a indexOf: 40) printString.
Transcript showCr: (a includes: 99) printString.
Transcript showCr: a isEmpty printString.
Transcript showCr: (a copyReplaceAll: #(20 30) with: #(0)) printString.

b := a copy.
b at: 1 put: 999.
Transcript showCr: a first printString.
Transcript showCr: b first printString.

c := Array new: 3.
c at: 1 put: 'x'; at: 2 put: 'y'.
Transcript showCr: c printString.
Transcript showCr: (Array new: 2 withAll: 7) printString.
Transcript showCr: (Array with: 1 with: 2 with: 3) printString.
Transcript showCr: a asOrderedCollection removeFirst printString.
Transcript showCr: (a asOrderedCollection addFirst: 0; yourself) asArray printString.
Transcript showCr: a readStream next printString.
