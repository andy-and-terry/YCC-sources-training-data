Transcript showCr: (1 to: 10) asOrderedCollection printString.
Transcript showCr: ((1 to: 10) select: [:x | x isPrime]) printString.
Transcript showCr: ((1 to: 5) inject: 1 into: [:a :b | a * b]) printString.
(1 to: 3) with: #(a b c) do: [:n :s | Transcript showCr: n printString, s].
