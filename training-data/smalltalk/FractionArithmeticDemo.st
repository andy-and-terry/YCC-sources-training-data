| a b sum big |
a := 1/3.
b := 2/5.

Transcript showCr: (a + b) printString.
Transcript showCr: (a * b) printString.
Transcript showCr: (a / b) printString.
Transcript showCr: (a - b) printString.
Transcript showCr: (6/8) printString.
Transcript showCr: (6/3) printString.
Transcript showCr: (6/3) class name.
Transcript showCr: a class name.
Transcript showCr: a numerator printString, '/', a denominator printString.
Transcript showCr: a reciprocal printString.
Transcript showCr: (a < b) printString.
Transcript showCr: (1/2 + 0.25) printString.
Transcript showCr: (7/2) floor printString.
Transcript showCr: (7/2) ceiling printString.
Transcript showCr: (7/2) rounded printString.
Transcript showCr: (7/2) truncated printString.

sum := (1 to: 10) inject: 0 into: [ :acc :n | acc + (1/n) ].
Transcript showCr: 'H10 = ', sum printString.

big := 100 factorial.
Transcript showCr: big class name.
Transcript showCr: (big printString size) printString.
Transcript showCr: (2 raisedTo: 100) printString.
Transcript showCr: (1000000000 * 1000000000) class name.
Transcript showCr: (12 gcd: 18) printString.
Transcript showCr: (4 lcm: 6) printString.
