| i n acc |
1 to: 3 do: [ :k | Transcript show: k printString; show: ' ' ].
Transcript cr.

10 to: 1 by: -3 do: [ :k | Transcript show: k printString; show: ' ' ].
Transcript cr.

#(a b c) reverseDo: [ :e | Transcript show: e printString; show: ' ' ].
Transcript cr.

i := 0.
[ i < 4 ] whileTrue: [ i := i + 1 ].
Transcript showCr: i printString.

n := 27.
acc := 0.
[ n = 1 ] whileFalse: [ n := n even ifTrue: [ n // 2 ] ifFalse: [ 3 * n + 1 ]. acc := acc + 1 ].
Transcript showCr: acc printString.

3 timesRepeat: [ Transcript show: '*' ].
Transcript cr.

i := 10.
[ i := i - 3. i > 0 ] whileTrue.
Transcript showCr: i printString.

#(1 2 3) with: #(4 5 6) do: [ :a :b | Transcript show: (a * b) printString; show: ' ' ].
Transcript cr.

#(10 20 30) doWithIndex: [ :e :idx | Transcript show: idx printString, ':', e printString, ' ' ].
Transcript cr.

#(1 2 3 4) do: [ :e | Transcript show: e printString ] separatedBy: [ Transcript show: ', ' ].
Transcript cr.
1 to: 0 do: [ :k | Transcript showCr: 'never' ].
