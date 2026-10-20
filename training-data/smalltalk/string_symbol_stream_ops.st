| s ws rs |
s := 'Hello, World'.
Transcript showCr: s size printString; showCr: s asUppercase; showCr: s reverse; showCr: s asSymbol printString.
Transcript showCr: (s copyFrom: 1 to: 5); showCr: (s indexOf: $W) printString.
Transcript showCr: (s copyReplaceAll: 'World' with: 'Smalltalk').
Transcript showCr: (s occurrencesOf: $l) printString.
Transcript showCr: (s select: [:ch | ch isVowel]).
Transcript showCr: (s substrings: ', ') printString.
Transcript showCr: (s , '!').
Transcript showCr: (s includesSubstring: 'World') printString.
Transcript showCr: s first printString; showCr: s last printString.
Transcript showCr: (s asSet size) printString.
Transcript showCr: ('abc' < 'abd') printString.
Transcript showCr: ('42' asNumber + 1) printString; showCr: 42 printString; showCr: (42 printString: 2); showCr: 3.14159 printString.
ws := WriteStream on: String new.
ws nextPutAll: 'x='; print: 42; nextPut: $;; tab; nextPutAll: 'end'; nl.
Transcript showCr: ws contents.
rs := ReadStream on: #(1 2 3 4 5).
[rs atEnd] whileFalse: [Transcript show: rs next printString; show: ' '].
Transcript cr.
Transcript showCr: (String new: 3 withAll: $z).
