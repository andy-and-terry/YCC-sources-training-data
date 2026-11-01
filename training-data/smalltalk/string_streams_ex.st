| ws rs |
ws := WriteStream on: String new.
ws nextPutAll: 'Hello'; nextPut: $,; space; nextPutAll: 'World'.
Transcript showCr: ws contents.
rs := ReadStream on: #(1 2 3 4 5).
[rs atEnd] whileFalse: [Transcript show: rs next printString; show: ' '].
Transcript cr.
