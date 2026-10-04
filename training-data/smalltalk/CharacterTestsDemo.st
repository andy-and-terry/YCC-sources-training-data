| text |
text := 'Hello, World 2024!'.

Transcript showCr: (text select: [ :c | c isUppercase ]).
Transcript showCr: (text select: [ :c | c isDigit ]).
Transcript showCr: (text reject: [ :c | c isLetter or: [ c isDigit ] ]).
Transcript showCr: (text count: [ :c | c isVowel ]) printString.
Transcript showCr: (text collect: [ :c | c isLetter ifTrue: [ c asUppercase ] ifFalse: [ c ] ]).

Transcript showCr: $a value printString.
Transcript showCr: (Character value: 65) printString.
Transcript showCr: $7 digitValue printString.
Transcript showCr: (Character digitValue: 11) printString.
Transcript showCr: ($a < $b) printString.
Transcript showCr: $  isSpace printString.
Transcript showCr: $a asSymbol printString.
Transcript showCr: $z asInteger printString.
Transcript showCr: ((text detect: [ :c | c isDigit ]) digitValue * 2) printString.
Transcript showCr: (text asSet size) printString.
Transcript showCr: (text asBag occurrencesOf: $l) printString.
