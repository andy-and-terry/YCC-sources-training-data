| counter makeAdder add5 fact i result |
makeAdder := [:n | [:x | x + n]].
add5 := makeAdder value: 5.
Transcript showCr: (add5 value: 10) printString.
counter := 0.
5 timesRepeat: [counter := counter + 1].
Transcript showCr: counter printString.
1 to: 10 by: 3 do: [:k | Transcript show: k printString; show: ' '].
Transcript cr.
10 to: 1 by: -4 do: [:k | Transcript show: k printString; show: ' '].
Transcript cr.
i := 0.
[i < 3] whileTrue: [i := i + 1].
[i <= 0] whileFalse: [i := i - 1].
Transcript showCr: i printString.
result := (3 > 2) ifTrue: ['yes'] ifFalse: ['no'].
Transcript showCr: result.
Transcript showCr: (nil ifNil: ['was nil']).
Transcript showCr: (5 between: 1 and: 10) printString.
Transcript showCr: ((1 to: 5) inject: 1 into: [:a :b | a * b]) printString.
fact := nil.
fact := [:n | n <= 1 ifTrue: [1] ifFalse: [n * (fact value: n - 1)]].
Transcript showCr: (fact value: 10) printString.
Transcript showCr: ([:a :b | a max: b] valueWithArguments: #(3 9)) printString.
Transcript showCr: [:x | x] numArgs printString.
