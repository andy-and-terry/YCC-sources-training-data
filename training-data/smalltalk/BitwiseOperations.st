Transcript showCr: (12 bitAnd: 10) printString.
Transcript showCr: (12 bitOr: 10) printString.
Transcript showCr: (12 bitXor: 10) printString.
Transcript showCr: (1 bitShift: 4) printString.
Transcript showCr: (256 bitShift: -3) printString.
Transcript showCr: (5 bitAt: 1) printString.
Transcript showCr: (5 bitAt: 2) printString.
Transcript showCr: (255 printString: 2).
Transcript showCr: (6 isBitSet: 2) printString.
Transcript showCr: (10 bitInvert) printString.
Transcript showCr: (1 bitShift: 40) printString.
Transcript showCr: ((1 to: 8) inject: 0 into: [ :acc :i | acc bitOr: (1 bitShift: i - 1) ]) printString.
