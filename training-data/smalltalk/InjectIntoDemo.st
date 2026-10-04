| numbers sum product longest maxVal counts |
numbers := #(3 1 4 1 5 9 2 6).

sum := numbers inject: 0 into: [ :acc :each | acc + each ].
Transcript showCr: 'sum: ', sum printString.

product := (1 to: 5) inject: 1 into: [ :acc :each | acc * each ].
Transcript showCr: 'product: ', product printString.

maxVal := numbers inject: numbers first into: [ :acc :each | acc max: each ].
Transcript showCr: 'max: ', maxVal printString.

longest := #('pear' 'banana' 'fig') inject: '' into: [ :acc :each |
    each size > acc size ifTrue: [ each ] ifFalse: [ acc ] ].
Transcript showCr: 'longest: ', longest.

counts := numbers inject: Dictionary new into: [ :dict :each |
    dict at: each put: (dict at: each ifAbsent: [ 0 ]) + 1.
    dict ].
(counts keys asSortedCollection) do: [ :k |
    Transcript showCr: k printString, ' -> ', (counts at: k) printString ].

Transcript showCr: (numbers inject: '' into: [ :acc :each | acc, each printString ]).
