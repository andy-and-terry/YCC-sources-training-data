| squares evens sum |
squares := (1 to: 10) collect: [ :i | i * i ].
Transcript showCr: squares printString.

evens := (1 to: 20) select: [ :i | i even ].
Transcript showCr: evens printString.

sum := (1 to: 100) inject: 0 into: [ :a :b | a + b ].
Transcript showCr: sum printString.

Transcript showCr: (10 to: 1 by: -3) asArray printString.
Transcript showCr: (1 to: 0) isEmpty printString.
Transcript showCr: (1 to: 10 by: 2) size printString.
Transcript showCr: ((1 to: 5) collect: [ :i | i factorial ]) printString.
Transcript showCr: ((1 to: 30) detect: [ :i | i * i > 200 ]) printString.
Transcript showCr: (1 to: 5) reverse printString.
Transcript showCr: (0 to: 1 by: 0.25) asArray printString.
