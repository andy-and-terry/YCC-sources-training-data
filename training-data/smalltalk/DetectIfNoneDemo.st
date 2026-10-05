| numbers found missing names |
numbers := #(3 8 15 22 31).

found := numbers detect: [ :n | n even ].
Transcript showCr: 'First even: ', found printString.

missing := numbers detect: [ :n | n > 100 ] ifNone: [ nil ].
Transcript showCr: 'Over 100: ', missing printString.

Transcript showCr: (numbers anySatisfy: [ :n | n > 30 ]) printString.
Transcript showCr: (numbers allSatisfy: [ :n | n > 0 ]) printString.
Transcript showCr: (numbers count: [ :n | n odd ]) printString.
Transcript showCr: (numbers includes: 15) printString.
Transcript showCr: (numbers indexOf: 22) printString.

names := OrderedCollection withAll: #('ann' 'bob' 'cy').
Transcript showCr: (names detect: [ :s | s size > 2 ] ifNone: [ 'none' ]).
Transcript showCr: (names reject: [ :s | s first = $a ]) printString.
Transcript showCr: (names collect: [ :s | s asUppercase ]) printString.
