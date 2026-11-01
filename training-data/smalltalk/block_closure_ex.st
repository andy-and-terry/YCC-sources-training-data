| adder makeCounter c |
adder := [:a :b | a + b].
Transcript showCr: (adder value: 2 value: 3) printString.
makeCounter := [| n | n := 0. [n := n + 1]].
c := makeCounter value.
c value. c value.
Transcript showCr: c value printString.
