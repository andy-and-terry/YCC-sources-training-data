| a b x |
a := true.
b := false.
Transcript showCr: (a & b) printString.
Transcript showCr: (a | b) printString.
Transcript showCr: (a and: [b]) printString.
Transcript showCr: (a or: [1/0]) printString.
Transcript showCr: a not printString.
Transcript showCr: (a xor: b) printString.

x := 15.
Transcript showCr: (x > 10 ifTrue: ['big'] ifFalse: ['small']).
Transcript showCr: (x even ifTrue: ['even']) printString.
Transcript showCr: (x between: 10 and: 20) printString.
Transcript showCr: (x max: 20) printString.
Transcript showCr: (nil isNil) printString.
Transcript showCr: (nil ifNil: ['default']) printString.
Transcript showCr: (x isString) printString.
