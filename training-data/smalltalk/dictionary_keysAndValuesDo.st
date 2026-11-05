| d |
d := Dictionary new.
d at: #a put: 1; at: #b put: 2; at: #c put: 3.
d keysAndValuesDo: [:k :v | Transcript showCr: k printString, ' -> ', v printString].
(d at: #z ifAbsent: [0]) printNl.
(d includesKey: #a) printNl.
d keys asSortedCollection printNl.
