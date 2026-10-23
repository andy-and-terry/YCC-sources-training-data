| str arr |
str := 'Smalltalk'.
Transcript showCr: (str copyFrom: 1 to: 5).
Transcript showCr: (str copyFrom: 6).
Transcript showCr: (str first: 3).
Transcript showCr: (str last: 4).

arr := #(10 20 30 40 50).
Transcript showCr: (arr copyFrom: 2 to: 4) printString.
Transcript showCr: (arr copyWith: 60) printString.
Transcript showCr: arr reverse printString.
