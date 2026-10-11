| s |
s := 'Mixed Case Text'.
Transcript showCr: s asUppercase.
Transcript showCr: s asLowercase.
Transcript showCr: s first printString.
Transcript showCr: s first isUppercase printString.
Transcript showCr: (s select: [ :c | c isUppercase ]).
Transcript showCr: (s reject: [ :c | c isSeparator ]).
Transcript showCr: (s collect: [ :c | c isVowel ifTrue: [ $* ] ifFalse: [ c ] ]).
Transcript showCr: ('apple' < 'banana') printString.
Transcript showCr: ('abc' = 'abc') printString.
Transcript showCr: ('abc' == 'abc') printString.
Transcript showCr: ('ABC' sameAs: 'abc') printString.
Transcript showCr: s size printString.
Transcript showCr: s reversed.
Transcript showCr: s asSymbol printString.
