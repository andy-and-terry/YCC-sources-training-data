| s |
s := 'Hello, Smalltalk World!'.
Transcript showCr: s asUppercase.
Transcript showCr: s asLowercase.
Transcript showCr: s size printString.
Transcript showCr: (s substrings: ' ') printString.
Transcript showCr: (s copyReplaceAll: 'World' with: 'Programming').
