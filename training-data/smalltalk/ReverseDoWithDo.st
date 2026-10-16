| a b |
a := #(1 2 3 4).
b := #('one' 'two' 'three' 'four').

a reverseDo: [ :x | Transcript show: x printString; show: ' ' ].
Transcript cr.

a with: b do: [ :n :s | Transcript showCr: n printString, '=', s ].

a doWithIndex: [ :x :i | Transcript show: (x * i) printString; show: ' ' ].
Transcript cr.

a keysAndValuesDo: [ :i :x | Transcript show: i printString, ':', x printString, ' ' ].
Transcript cr.

Transcript showCr: (a with: a collect: [ :x :y | x * y ]) printString.
Transcript showCr: a reverse printString.
Transcript showCr: (a , #(5 6)) printString.
