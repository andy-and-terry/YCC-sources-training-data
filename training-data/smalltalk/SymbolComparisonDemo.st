| a b |
a := #hello.
b := 'hello' asSymbol.
Transcript showCr: (a == b) printString.
Transcript showCr: ('abc' = 'abc') printString.
Transcript showCr: ('abc' == 'abc') printString.
Transcript showCr: a size printString.
Transcript showCr: #with:with: numArgs printString.
Transcript showCr: (#(1 $a 'str' #sym (1 2)) collect: [:e | e class name]) printString.
Transcript showCr: a asString reversed.
Transcript showCr: (3 perform: #+ with: 4) printString.
Transcript showCr: (a -> 5) printString.
