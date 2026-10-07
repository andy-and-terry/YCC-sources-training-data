| d |
d := Dictionary new.
d at: #apple put: 3; at: #pear put: 5; at: #fig put: 1.

d keysAndValuesDo: [:k :v | Transcript showCr: k printString, ' => ', v printString].
Transcript showCr: (d collect: [:v | v * 2]) printString.
Transcript showCr: (d select: [:v | v > 2]) size printString.
Transcript showCr: (d keys asSortedCollection: [:a :b | a <= b]) printString.
Transcript showCr: d values asSortedCollection asArray printString.
Transcript showCr: (d inject: 0 into: [:a :v | a + v]) printString.
Transcript showCr: (d at: #kiwi ifAbsent: ['none']) printString.
d removeKey: #fig.
Transcript showCr: d size printString.
Transcript showCr: (d anyOne) printString.
Transcript showCr: (d includes: 5) printString.
