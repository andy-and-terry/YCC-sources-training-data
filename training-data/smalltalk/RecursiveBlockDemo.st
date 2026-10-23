| fact fib memo gcd |
"A block that refers to itself through the variable it is assigned to."
fact := nil.
fact := [ :n | n <= 1 ifTrue: [ 1 ] ifFalse: [ n * (fact value: n - 1) ] ].
Transcript showCr: (fact value: 10) printString.

fib := nil.
fib := [ :n | n < 2 ifTrue: [ n ] ifFalse: [ (fib value: n - 1) + (fib value: n - 2) ] ].
Transcript showCr: ((1 to: 10) collect: [ :i | fib value: i ]) printString.

memo := Dictionary new.
fib := nil.
fib := [ :n |
    n < 2
        ifTrue: [ n ]
        ifFalse: [ memo at: n ifAbsentPut: [ (fib value: n - 1) + (fib value: n - 2) ] ] ].
Transcript showCr: (fib value: 60) printString.
Transcript showCr: memo size printString.

gcd := nil.
gcd := [ :a :b | b = 0 ifTrue: [ a ] ifFalse: [ gcd value: b value: a \\ b ] ].
Transcript showCr: (gcd value: 48 value: 18) printString.
