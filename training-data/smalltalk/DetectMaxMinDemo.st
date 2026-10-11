| nums words |
nums := #(14 3 92 7 41).
Transcript showCr: (nums inject: nums first into: [ :m :x | m max: x ]) printString.
Transcript showCr: (nums inject: nums first into: [ :m :x | m min: x ]) printString.
Transcript showCr: (nums detectMax: [ :x | x ]) printString.
Transcript showCr: (nums detectMin: [ :x | x \\ 10 ]) printString.
Transcript showCr: (nums detect: [ :x | x > 50 ]) printString.
Transcript showCr: (nums detect: [ :x | x > 500 ] ifNone: [ 'none' ]) printString.
Transcript showCr: (nums anySatisfy: [ :x | x even ]) printString.
Transcript showCr: (nums allSatisfy: [ :x | x > 0 ]) printString.
Transcript showCr: (nums count: [ :x | x odd ]) printString.

words := #('aa' 'b' 'cccc' 'dd').
Transcript showCr: (words detectMax: [ :w | w size ]).
