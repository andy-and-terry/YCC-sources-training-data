| ws rs |
ws := WriteStream on: String new.
ws nextPutAll: 'Hello'; nextPut: $,; space; nextPutAll: 'world'.
ws contents displayNl.
rs := ReadStream on: #(1 2 3 4).
[rs atEnd] whileFalse: [rs next printNl].
