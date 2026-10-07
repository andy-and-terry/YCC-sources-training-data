| text letters digits vowels |
text := 'Hello, World 123!'.

letters := text select: [ :c | c isLetter ].
digits := text select: [ :c | c isDigit ].
vowels := text select: [ :c | c isVowel ].
Transcript showCr: letters.
Transcript showCr: digits.
Transcript showCr: vowels.

Transcript showCr: (text count: [ :c | c isUppercase ]) printString.
Transcript showCr: (text count: [ :c | c isSeparator ]) printString.
Transcript showCr: (text reject: [ :c | c isLetter or: [ c isDigit ] ]) printString.

Transcript showCr: $a asInteger printString.
Transcript showCr: 97 asCharacter printString.
Transcript showCr: $a asUppercase printString.
Transcript showCr: $Z asLowercase printString.
Transcript showCr: (Character value: 65) printString.
Transcript showCr: $7 digitValue printString.
Transcript showCr: (Character digitValue: 11) printString.
Transcript showCr: ($a < $b) printString.
Transcript showCr: $a asString, $b asString.
Transcript showCr: (text collect: [ :c | c isLetter ifTrue: [ c asUppercase ] ifFalse: [ c ] ]).
Transcript showCr: text asBag size printString.
Transcript showCr: (text asSet includes: $W) printString.
Transcript showCr: text reverse.
Transcript showCr: (text indexOf: $W) printString.
