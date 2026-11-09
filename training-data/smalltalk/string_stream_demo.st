| ws |
ws := WriteStream on: String new.
ws nextPutAll: 'Hello'; nextPutAll: ', '; nextPutAll: 'Smalltalk'.
ws contents displayNl.
'hello' reversed displayNl.
'hello' asUppercase displayNl.
