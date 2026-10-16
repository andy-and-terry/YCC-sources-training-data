| a b lookup |
a := nil.
b := 'value'.

Transcript showCr: (a ifNil: [ 'default' ]) printString.
Transcript showCr: (b ifNil: [ 'default' ]) printString.
Transcript showCr: (b ifNotNil: [ :x | x size ]) printString.
Transcript showCr: (a ifNotNil: [ :x | x size ]) printString.
Transcript showCr: (a isNil) printString.
Transcript showCr: (b notNil) printString.

lookup := Dictionary new.
lookup at: #name put: 'Pat'.
Transcript showCr: ((lookup at: #name ifAbsent: [ nil ]) ifNil: [ 'anonymous' ]).
Transcript showCr: ((lookup at: #age ifAbsent: [ nil ]) ifNil: [ 'unknown age' ]).
Transcript showCr: (a isNil ifTrue: [ 'nil!' ] ifFalse: [ 'not nil' ]).
