| nums |
nums := #(2 4 6 8 10).

Transcript showCr: (nums conform: [ :x | x even ]) printString.
Transcript showCr: (nums conform: [ :x | x > 5 ]) printString.
Transcript showCr: (nums contains: [ :x | x > 9 ]) printString.
Transcript showCr: (nums contains: [ :x | x odd ]) printString.
Transcript showCr: (#() conform: [ :x | false ]) printString.
Transcript showCr: (nums count: [ :x | x > 4 ]) printString.
Transcript showCr: (nums includes: 8) printString.
Transcript showCr: ('hello' conform: [ :c | c isLetter ]) printString.
Transcript showCr: ('he llo' contains: [ :c | c isSeparator ]) printString.
