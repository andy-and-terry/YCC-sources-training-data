| a b sums products |
a := #(1 2 3 4).
b := #(10 20 30 40).

sums := a with: b collect: [ :x :y | x + y ].
Transcript showCr: sums printString.

products := a with: b collect: [ :x :y | x * y ].
Transcript showCr: products printString.

a with: b do: [ :x :y | Transcript showCr: x printString, ' -> ', y printString ].
