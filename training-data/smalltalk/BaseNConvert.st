#(2 8 16 36) do: [:b |
    Transcript showCr: '255 in base ', b printString, ' = ', (255 printString: b) asLowercase].
(Number readFrom: '255') printNl.
(Integer readFrom: 'ff' radix: 16) printNl.
