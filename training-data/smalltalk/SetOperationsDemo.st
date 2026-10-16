| a b |
a := Set withAll: #(1 2 3 4 5).
b := Set withAll: #(4 5 6 7).

Transcript showCr: (a select: [ :x | b includes: x ]) asSortedCollection asArray printString.
Transcript showCr: (a reject: [ :x | b includes: x ]) asSortedCollection asArray printString.
Transcript showCr: ((a copy) addAll: b; yourself) asSortedCollection asArray printString.

a add: 3; add: 3.
Transcript showCr: a size printString.
a remove: 1.
Transcript showCr: (a includes: 1) printString.
Transcript showCr: (a remove: 99 ifAbsent: [ 'not there' ]) printString.
Transcript showCr: (#(1 2 2 3 3 3) asSet size) printString.
