| ws result |
ws := WriteStream on: String new.
ws nextPutAll: 'Items: '.
#(1 2 3) do: [ :i | ws print: i ] separatedBy: [ ws nextPutAll: ', ' ].
ws nextPut: $.; nl; tab; nextPutAll: 'done'.
Transcript showCr: ws contents.

ws := WriteStream on: (Array new: 0).
1 to: 5 do: [ :i | ws nextPut: i * i ].
Transcript showCr: ws contents printString.

result := String new: 3 withAll: $z.
Transcript showCr: result.
Transcript showCr: (String new: 2) size printString.
Transcript showCr: ((WriteStream with: 'abc') nextPutAll: 'def'; contents).
Transcript display: 42; cr; print: 'quoted'; cr; show: 'plain'; cr.
