"Symbols are interned: two literals with the same characters are
identical objects, unlike Strings, which compare equal by value but
are distinct objects unless explicitly shared."

| sym1 sym2 str1 str2 |
sym1 := #hello.
sym2 := #hello.
str1 := 'hello' copy.
str2 := 'hello' copy.

Transcript showCr: 'symbols identical: ', (sym1 == sym2) printString.
Transcript showCr: 'strings identical: ', (str1 == str2) printString.
Transcript showCr: 'strings equal: ', (str1 = str2) printString.
Transcript showCr: 'symbol class: ', sym1 class name.
Transcript showCr: 'string class: ', str1 class name.
Transcript showCr: 'symbol as string: ', sym1 asString.
Transcript showCr: 'string as symbol identical to literal: ', (str1 asSymbol == #hello) printString.
