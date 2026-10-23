"Set algebra using Smalltalk Set: union, intersection and difference."
| a b union inter diff symDiff |
a := Set withAll: #(1 2 3 4 5).
b := Set withAll: #(4 5 6 7).

union := a copy addAll: b; yourself.
inter := a select: [:x | b includes: x].
diff := a reject: [:x | b includes: x].
symDiff := (a reject: [:x | b includes: x]) copy addAll: (b reject: [:x | a includes: x]); yourself.

Transcript showCr: 'union: ', union asSortedCollection asArray printString.
Transcript showCr: 'intersection: ', inter asSortedCollection asArray printString.
Transcript showCr: 'difference: ', diff asSortedCollection asArray printString.
Transcript showCr: 'symmetric: ', symDiff asSortedCollection asArray printString.

"Sets ignore duplicates"
Transcript showCr: (Set withAll: #(1 1 2 2 3)) size printString.

"Subset test"
Transcript showCr: ((Set withAll: #(4 5)) allSatisfy: [:x | a includes: x]) printString.
Transcript showCr: (a includes: 9) printString.

"Removal"
a remove: 1.
a remove: 99 ifAbsent: [Transcript showCr: 'not present'].
Transcript showCr: a asSortedCollection asArray printString.
