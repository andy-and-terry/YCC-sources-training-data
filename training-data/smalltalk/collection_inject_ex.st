| nums |
nums := #(3 1 4 1 5 9 2 6).
Transcript showCr: (nums inject: 0 into: [:a :b | a + b]) printString.
Transcript showCr: (nums select: [:x | x even]) printString.
Transcript showCr: (nums collect: [:x | x * x]) printString.
Transcript showCr: (nums asSortedCollection: [:a :b | a > b]) asArray printString.
Transcript showCr: (nums detect: [:x | x > 4] ifNone: [nil]) printString.
