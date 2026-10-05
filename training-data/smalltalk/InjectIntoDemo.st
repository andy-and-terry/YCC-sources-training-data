| numbers sum product longest maxVal counts |
numbers := #(3 1 4 1 5 9 2 6).

sum := numbers inject: 0 into: [ :acc :each | acc + each ].
Transcript showCr: 'Sum: ', sum printString.

product := (1 to: 6) inject: 1 into: [ :acc :each | acc * each ].
Transcript showCr: 'Product: ', product printString.

longest := #('pear' 'banana' 'fig') inject: '' into: [ :acc :each |
    each size > acc size ifTrue: [ each ] ifFalse: [ acc ] ].
Transcript showCr: 'Longest: ', longest.

maxVal := numbers inject: numbers first into: [ :a :b | a max: b ].
Transcript showCr: 'Max: ', maxVal printString.

counts := Dictionary new.
numbers do: [ :n | counts at: n put: (counts at: n ifAbsent: [ 0 ]) + 1 ].
Transcript showCr: (counts at: 1) printString.

Transcript showCr: (numbers fold: [ :a :b | a + b ]) printString.
Transcript showCr: (numbers with: numbers reverse collect: [ :a :b | a * b ]) printString.
