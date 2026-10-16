#($a $Z $5 $  $!) do: [ :c |
    Transcript showCr: c printString, ' code=', c value printString,
        ' letter=', c isLetter printString,
        ' digit=', c isDigit printString ].

Transcript showCr: $a asUppercase printString.
Transcript showCr: (Character value: 65) printString.
Transcript showCr: $7 digitValue printString.
Transcript showCr: (Character digitValue: 11) printString.
Transcript showCr: (Character value: 10) value printString.
Transcript showCr: ($a < $b) printString.
Transcript showCr: ($a value + 2) asCharacter printString.
Transcript showCr: ((97 to: 101) collect: [ :v | v asCharacter ]) printString.
