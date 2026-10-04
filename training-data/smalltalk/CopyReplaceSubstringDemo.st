| s |
s := 'hello world'.
Transcript showCr: (s copyFrom: 1 to: 5).
Transcript showCr: (s copyReplaceAll: 'world' with: 'there').
Transcript showCr: (s copyWith: $!).
Transcript showCr: s asUppercase.
Transcript showCr: s first asString.
Transcript showCr: s last asString.
Transcript showCr: (s indexOf: $o) printString.
Transcript showCr: (s occurrencesOf: $l) printString.
Transcript showCr: (s includesSubstring: 'lo w') printString.
Transcript showCr: (s select: [:c | c isVowel]).
Transcript showCr: (s reject: [:c | c isVowel]).
Transcript showCr: s reverse.
Transcript showCr: (s asSet size) printString.
Transcript showCr: (s , '!' , '!').
Transcript showCr: s hash printString size > 0.
