| a b sum |
a := Number readFrom: '1010' radix: 2.
b := Number readFrom: '1011' radix: 2.
sum := a + b.
Transcript showCr: (sum printString: 2). "10101"
