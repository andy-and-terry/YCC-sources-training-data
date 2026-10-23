| a s b |
a := Array new: 6.
a atAllPut: 0.
a replaceFrom: 2 to: 4 with: #(7 8 9) startingAt: 1.
Transcript showCr: a printString.

s := 'hello world' copy.
s replaceFrom: 1 to: 5 with: 'HELLO' startingAt: 1.
Transcript showCr: s.

s replaceAll: $o with: $0.
Transcript showCr: s.

b := #(1 2 3 4 5) copy.
b replaceFrom: 1 to: 3 with: b startingAt: 3.
Transcript showCr: b printString.

Transcript showCr: ((1 to: 5) asArray copyReplaceAll: #(2 3) with: #(20 30 40)) printString.
Transcript showCr: ('banana' copyReplacing: $a with: $o) printString.
