| ws |
ws := WriteStream on: String new.
ws nextPutAll: 'Hello'; nextPut: $,; space; nextPutAll: 'Smalltalk'.
Transcript showCr: ws contents.
