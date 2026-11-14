| ws rs |
ws := WriteStream on: String new.
ws nextPutAll: 'hello'; nextPut: $,; nextPutAll: ' world'.
ws contents displayNl.
rs := ReadStream on: #(1 2 3).
[ rs atEnd ] whileFalse: [ rs next printNl ].
