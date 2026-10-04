| numbers firstEven firstBig missing words |
numbers := #(1 3 5 6 7 8).

firstEven := numbers detect: [ :n | n even ].
Transcript showCr: 'first even: ', firstEven printString.

firstBig := numbers detect: [ :n | n > 100 ] ifNone: [ nil ].
Transcript showCr: 'first big: ', firstBig printString.

missing := [ numbers detect: [ :n | n > 100 ] ]
    on: Error
    do: [ :e | Transcript showCr: 'no match found'. -1 ].
Transcript showCr: 'result: ', missing printString.

words := #('apple' 'banana' 'cherry').
Transcript showCr: (words detect: [ :w | w first = $b ] ifNone: [ 'none' ]).
Transcript showCr: (words anySatisfy: [ :w | w size > 5 ]) printString.
Transcript showCr: (words allSatisfy: [ :w | w size > 3 ]) printString.
Transcript showCr: (words count: [ :w | w includes: $a ]) printString.
Transcript showCr: (numbers indexOf: 6) printString.
Transcript showCr: (numbers copyFrom: 2 to: 4) printString.
Transcript showCr: (words collect: [ :w | w size ]) printString.
Transcript showCr: (numbers reject: [ :n | n odd ]) printString.
