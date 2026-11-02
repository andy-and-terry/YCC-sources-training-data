| nums |
nums := #(1 2 3 4 5).
Transcript showCr: (nums inject: 0 into: [:a :b | a + b]) printString.
Transcript showCr: (nums collect: [:x | x * x]) printString.
