| a b |
a := #hello.
b := 'hello' asSymbol.
Transcript showCr: (a == b) printString.
Transcript showCr: ('hello' = 'hello') printString.
Transcript showCr: ('hello' copy == 'hello' copy) printString.
Transcript showCr: a size printString.
Transcript showCr: (#with:with: numArgs) printString.
Transcript showCr: a asString reverse.
Transcript showCr: a class printString.
