| nums |
nums := #(3 1 4 1 5 9 2 6).
Transcript showCr: (nums inject: 0 into: [ :a :b | a + b ]) printString.
Transcript showCr: (nums inject: nums first into: [ :a :b | a max: b ]) printString.
Transcript showCr: (nums inject: 1 into: [ :a :b | a * b ]) printString.
Transcript showCr: (nums detect: [ :x | x > 4 ] ifNone: [ nil ]) printString.
Transcript showCr: (nums anySatisfy: [ :x | x > 8 ]) printString.
Transcript showCr: (nums count: [ :x | x odd ]) printString.
