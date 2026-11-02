| d |
d := Dictionary new.
d at: #a put: 1; at: #b put: 2.
d keysAndValuesDo: [:k :v | Transcript showCr: k printString, ' ', v printString].
