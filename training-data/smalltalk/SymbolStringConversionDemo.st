| s sym |
sym := #hello.
Transcript showCr: sym printString.
Transcript showCr: sym displayString.
Transcript showCr: sym asString.
Transcript showCr: sym size printString.
Transcript showCr: sym class name.
Transcript showCr: 'world' asSymbol printString.
Transcript showCr: ('hello' asSymbol == #hello) printString.
Transcript showCr: ('hello' copy == 'hello' copy) printString.
Transcript showCr: ('hello' = 'hello') printString.
Transcript showCr: (#with:with: numArgs) printString.
Transcript showCr: #+ numArgs printString.
Transcript showCr: #(#a #b #c) printString.
Transcript showCr: #(a b c) printString.
Transcript showCr: #(1 2 #(3 4)) printString.
Transcript showCr: {1+1. 'two'. #three} printString.

s := 'Smalltalk' asUppercase.
Transcript showCr: s.
Transcript showCr: s asSymbol printString.
Transcript showCr: s asLowercase asSymbol printString.
Transcript showCr: (#foo , 'bar') printString.
Transcript showCr: (#foo , 'bar') class name.
Transcript showCr: (3 perform: #+ with: 4) printString.
Transcript showCr: ('abc' perform: #size) printString.
Transcript showCr: (#(3 1 2) asSortedCollection: [ :a :b | a > b ]) asArray printString.
