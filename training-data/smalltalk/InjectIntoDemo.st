| nums sum product longest pairs |
nums := #(4 8 15 16 23 42).

sum := nums inject: 0 into: [ :acc :n | acc + n ].
Transcript showCr: 'sum: ', sum printString.

product := (1 to: 6) inject: 1 into: [ :acc :n | acc * n ].
Transcript showCr: 'product: ', product printString.

longest := #('fig' 'banana' 'kiwi' 'cherry') inject: '' into: [ :best :w |
    w size > best size ifTrue: [ w ] ifFalse: [ best ] ].
Transcript showCr: 'longest: ', longest.

Transcript showCr: (nums detect: [ :n | n > 15 ]) printString.
Transcript showCr: (nums detect: [ :n | n > 100 ] ifNone: [ 'none' ]) printString.
Transcript showCr: (nums anySatisfy: [ :n | n even not ]) printString.
Transcript showCr: (nums allSatisfy: [ :n | n > 0 ]) printString.
Transcript showCr: (nums count: [ :n | n even ]) printString.

pairs := nums with: (1 to: 6) collect: [ :n :i | n * i ].
Transcript showCr: pairs printString.
Transcript showCr: (nums copyFrom: 2 to: 4) printString.
Transcript showCr: (nums inject: nums first into: [ :m :n | m max: n ]) printString.
