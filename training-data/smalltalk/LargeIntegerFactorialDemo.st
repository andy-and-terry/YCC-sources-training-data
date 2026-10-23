| fact big |
fact := nil.
fact := [:n | n <= 1 ifTrue: [1] ifFalse: [n * (fact value: n - 1)]].

Transcript showCr: (fact value: 10) printString.
Transcript showCr: (fact value: 25) printString.

big := 1000000000 * 1000000000.
Transcript showCr: big printString.
Transcript showCr: big class name.
Transcript showCr: (SmallInteger maxVal + 1) class name.
Transcript showCr: (2 raisedTo: 100) printString.
Transcript showCr: ((2 raisedTo: 100) printString size) printString.
Transcript showCr: (100 factorial / 98 factorial) printString.
Transcript showCr: ((2 raisedTo: 64) \\ 1000) printString.
Transcript showCr: (12345678901234567890 // 1000) printString.
