| b2 adder compose twice counter |
b2 := [ :a :b | a * b ].
Transcript showCr: (b2 value: 6 value: 7) printString.
Transcript showCr: b2 numArgs printString.
Transcript showCr: ([ :a :b :c | a + b + c ] valueWithArguments: #(1 2 3)) printString.
Transcript showCr: [ 'no args' ] value.

adder := [ :n | [ :x | x + n ] ].
Transcript showCr: ((adder value: 10) value: 5) printString.

compose := [ :f :g | [ :x | f value: (g value: x) ] ].
twice := compose value: [ :x | x * 2 ] value: [ :x | x + 1 ].
Transcript showCr: (twice value: 4) printString.

counter := 0.
[ counter := counter + 1 ] value; value; value.
Transcript showCr: counter printString.
[ :x | x ] valueWithArguments: #(1 2).
