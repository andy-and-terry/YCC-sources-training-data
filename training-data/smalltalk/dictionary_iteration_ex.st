| d |
d := Dictionary new.
d at: #apple put: 3; at: #pear put: 5.
d keysAndValuesDo: [:k :v | Transcript showCr: k printString, ' -> ', v printString].
Transcript showCr: (d at: #fig ifAbsent: [0]) printString.
Transcript showCr: (d keys asSortedCollection: [:a :b | a <= b]) printString.
