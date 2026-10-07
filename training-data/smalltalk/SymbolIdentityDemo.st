| a b s1 s2 |
a := #hello.
b := 'hello' asSymbol.
Transcript showCr: (a == b) printString.

s1 := 'hello' copy.
s2 := 'hello' copy.
Transcript showCr: (s1 = s2) printString.
Transcript showCr: (s1 == s2) printString.

Transcript showCr: (a = 'hello') printString.
Transcript showCr: a size printString.
Transcript showCr: a asString printString.
Transcript showCr: #with:with: numArgs printString.
Transcript showCr: #+ numArgs printString.
Transcript showCr: #foo printString.
Transcript showCr: (#(1 $a 'str' #sym #(2 3)) collect: [ :e | e class name ]) printString.

Transcript showCr: (3 perform: #+ with: 4) printString.
Transcript showCr: (#(3 1 2) asSortedCollection: [ :x :y | x >= y ]) asArray printString.
Transcript showCr: (#(1 2 3) collect: #squared) printString.
