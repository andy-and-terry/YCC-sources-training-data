| s a |
s := 'Hello, Smalltalk world'.
Transcript showCr: (s copyFrom: 1 to: 5).
Transcript showCr: (s copyFrom: 8).
Transcript showCr: (s indexOf: $S) printString.
Transcript showCr: (s indexOf: $z) printString.
Transcript showCr: (s occurrencesOf: $l) printString.
Transcript showCr: (s copyReplaceAll: 'world' with: 'there').
Transcript showCr: (s copyWithout: $l).
Transcript showCr: (s copyWith: $!).
Transcript showCr: (s includesSubstring: 'talk') printString.
Transcript showCr: (s startsWith: 'Hello') printString.

a := #(10 20 30 40 50).
Transcript showCr: (a copyFrom: 2 to: 4) printString.
Transcript showCr: (a first: 2) printString.
Transcript showCr: (a last: 2) printString.
Transcript showCr: (a allButFirst) printString.
Transcript showCr: (a allButLast) printString.
