Transcript showCr: (true & false) printString; showCr: (true | false) printString; showCr: (true and: [false]) printString; showCr: (false or: [true]) printString.
Transcript showCr: true not printString; showCr: (true xor: false) printString.
Transcript showCr: (3 = 3.0) printString; showCr: (3 == 3) printString; showCr: ('abc' = 'abc') printString; showCr: ('abc' == 'abc') printString.
Transcript showCr: (#sym == #sym) printString; showCr: ((1/2) = 0.5) printString; showCr: ((1/2) = (2/4)) printString.
Transcript showCr: (#(1 2) = #(1 2)) printString; showCr: (nil isNil) printString; showCr: (3 isString) printString; showCr: 'x' isString printString.
Transcript showCr: (3 isKindOf: Integer) printString; showCr: (3 isMemberOf: SmallInteger) printString; showCr: 3 class name; showCr: 3 class class name.
Transcript showCr: (3 @ 4) printString; showCr: ((3 @ 4) + (1 @ 1)) printString; showCr: (3 -> 4) printString; showCr: (3 -> 4) key printString.
Transcript showCr: (thisContext printString size > 0) printString.
Transcript showCr: (1 max: 2; min: 0) printString.
Transcript showCr: ([:x | x > 2] value: 5) printString.
Transcript showCr: (5 between: 1 and: 3) printString; showCr: 5 isInteger printString; showCr: 5 isNumber printString.
Transcript showCr: (nil ifNotNil: [:x | x]) printString; showCr: ('a' -> 1) value printString.
Transcript showCr: (Smalltalk at: #Foo put: 42) printString; showCr: (Smalltalk at: #Foo) printString; showCr: (Smalltalk includesKey: #Foo) printString.
