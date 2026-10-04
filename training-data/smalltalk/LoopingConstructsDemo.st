| i total fact |
i := 0.
[ i < 3 ] whileTrue: [ Transcript showCr: 'while ', i printString. i := i + 1 ].

i := 10.
[ i <= 5 ] whileFalse: [ i := i - 3 ].
Transcript showCr: 'after whileFalse: ', i printString.

3 timesRepeat: [ Transcript show: 'hi ' ].
Transcript cr.

1 to: 10 by: 4 do: [ :k | Transcript show: k printString; show: ' ' ].
Transcript cr.

5 to: 1 by: -2 do: [ :k | Transcript show: k printString; show: ' ' ].
Transcript cr.

total := 0.
1 to: 100 do: [ :k | total := total + k ].
Transcript showCr: 'total: ', total printString.

fact := 1.
2 to: 10 do: [ :k | fact := fact * k ].
Transcript showCr: '10! = ', fact printString.

#(10 20 30) doWithIndex: [ :e :idx | Transcript showCr: idx printString, ': ', e printString ].
#(1 2 3) with: #(4 5 6) do: [ :a :b | Transcript show: (a * b) printString; show: ' ' ].
Transcript cr.
#(1 2 3) reverseDo: [ :e | Transcript show: e printString ].
Transcript cr.

i := 0.
[ i := i + 1. i < 5 ] whileTrue.
Transcript showCr: 'stopped at ', i printString.
