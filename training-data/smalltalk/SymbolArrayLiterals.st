Transcript showCr: #(1 2 3) printString.
Transcript showCr: #(foo bar baz) printString.
Transcript showCr: #(#a #b $c 'd' 4.5) printString.
Transcript showCr: #(true false nil) printString.
Transcript showCr: {1 + 1. 'two'. #three} printString.
Transcript showCr: #[1 2 255] printString.
Transcript showCr: #(#(1 2) #(3 4)) printString.
Transcript showCr: (Array new: 3) printString.
Transcript showCr: (Array new: 2 withAll: 0) printString.
Transcript showCr: (Array with: 1 with: 2 with: 3) printString.
Transcript showCr: #+ numArgs printString.
Transcript showCr: #at:put: numArgs printString.
Transcript showCr: (3 perform: #+ with: 4) printString.
