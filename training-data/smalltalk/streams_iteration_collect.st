| rs ws lines gen fib a b |
rs := ReadStream on: 'one two three'.
[rs atEnd] whileFalse: [Transcript showCr: (rs upTo: $ )].
rs reset.
Transcript showCr: (rs next: 3); showCr: rs peek printString; showCr: rs position printString.
rs skip: 1.
Transcript showCr: rs upToEnd.
ws := WriteStream on: (Array new: 0).
1 to: 5 do: [:i | ws nextPut: i * i].
Transcript showCr: ws contents printString.
(ReadStream on: (1 to: 10)) do: [:x | x even ifTrue: [Transcript show: x printString; show: ' ']].
Transcript cr.
Transcript showCr: ('a-b-c' subStrings: '-') printString.
Transcript showCr: (String new: 2) size printString.
a := 0. b := 1.
fib := OrderedCollection new.
10 timesRepeat: [fib add: a. b := a + b. a := b - a].
Transcript showCr: fib printString.
Transcript showCr: ((1 to: 20) detect: [:x | x * x > 150]) printString.
Transcript showCr: (#(1 2 3) with: #(4 5 6) collect: [:x :y | x * y]) printString.
Transcript showCr: (#(1 2 3) reverse , #(4)) printString.
#(1 2 3) doWithIndex: [:e :i | Transcript show: i printString, ':', e printString, ' '].
Transcript cr.
#(1 2 3) do: [:e | Transcript show: e printString] separatedBy: [Transcript show: ', '].
Transcript cr.
