| oc set dict bag sorted str |
oc := OrderedCollection new.
oc add: 5; add: 3; add: 8; addFirst: 1.
Transcript showCr: oc printString.
Transcript showCr: (oc collect: [:x | x * x]) printString.
Transcript showCr: (oc select: [:x | x odd]) printString.
Transcript showCr: (oc reject: [:x | x odd]) printString.
Transcript showCr: (oc inject: 0 into: [:a :b | a + b]) printString.
Transcript showCr: (oc detect: [:x | x > 4] ifNone: [nil]) printString.
Transcript showCr: (oc anySatisfy: [:x | x > 7]) printString.
Transcript showCr: (oc asSortedCollection: [:a :b | a > b]) asArray printString.
Transcript showCr: oc removeFirst printString; showCr: oc removeLast printString; showCr: oc size printString.
set := Set new. set add: 1; add: 2; add: 2.
Transcript showCr: set size printString.
dict := Dictionary new.
dict at: #a put: 1; at: #b put: 2.
Transcript showCr: (dict at: #a) printString; showCr: (dict at: #z ifAbsent: [0]) printString.
dict keysAndValuesDo: [:k :v | Transcript showCr: k printString, '->', v printString].
Transcript showCr: (dict keys asSortedCollection: [:a :b | a <= b]) asArray printString.
bag := Bag new. bag add: 'x'; add: 'x'; add: 'y'.
Transcript showCr: (bag occurrencesOf: 'x') printString.
Transcript showCr: (1 to: 5) asOrderedCollection printString.
Transcript showCr: (#(3 1 2) asSortedCollection) asArray printString.
