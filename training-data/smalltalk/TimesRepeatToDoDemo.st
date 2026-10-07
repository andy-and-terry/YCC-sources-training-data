| sum count |
sum := 0.
1 to: 10 do: [:i | sum := sum + i].
Transcript showCr: sum printString.

10 to: 1 by: -3 do: [:i | Transcript show: i printString; show: ' '].
Transcript cr.

count := 0.
5 timesRepeat: [count := count + 2].
Transcript showCr: count printString.

count := 100.
[count > 10] whileTrue: [count := count // 2].
Transcript showCr: count printString.

1 to: 3 do: [:i |
    1 to: i do: [:j | Transcript show: (i * j) printString; show: ' ']].
Transcript cr.
#(a b c) doWithIndex: [:e :i | Transcript show: i printString, e; show: ' '].
Transcript cr.
#(1 2 3) reverseDo: [:e | Transcript show: e printString].
Transcript cr.
