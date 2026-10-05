| i sum |
1 to: 3 do: [ :k | Transcript showCr: 'to:do: ', k printString ].

10 to: 1 by: -4 do: [ :k | Transcript showCr: 'down ', k printString ].

2 timesRepeat: [ Transcript showCr: 'repeat' ].

i := 0.
[ i < 3 ] whileTrue: [ i := i + 1 ].
Transcript showCr: 'while: ', i printString.

i := 10.
[ i <= 3 ] whileFalse: [ i := i - 3 ].
Transcript showCr: 'whileFalse: ', i printString.

sum := 0.
1 to: 100 do: [ :k | k odd ifTrue: [ sum := sum + k ] ].
Transcript showCr: 'odd sum: ', sum printString.

#(10 20 30) doWithIndex: [ :e :idx | Transcript showCr: idx printString, ': ', e printString ].
#(1 2 3) do: [ :e | Transcript show: e printString ] separatedBy: [ Transcript show: ', ' ].
Transcript cr.
#(1 2 3) reverseDo: [ :e | Transcript show: e printString ].
Transcript cr.
