| ws result rs |
ws := WriteStream on: String new.
ws nextPutAll: 'Hello'; nextPut: $,; space; nextPutAll: 'World'; nl.
ws print: 42; tab; print: 3/4.
Transcript showCr: ws contents.

result := String new writeStream.
#(1 2 3) do: [:each | result print: each] separatedBy: [result nextPutAll: ', '].
Transcript showCr: result contents.

rs := ReadStream on: #(1 2 3 4 5).
[rs atEnd] whileFalse: [Transcript show: rs next printString; show: ' '].
Transcript cr.
Transcript showCr: ('one two three' substrings: ' ') printString.
