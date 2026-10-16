| n count total |
n := 27.
count := 0.
[ n = 1 ] whileFalse: [
    n := n even ifTrue: [ n // 2 ] ifFalse: [ 3 * n + 1 ].
    count := count + 1 ].
Transcript showCr: 'collatz steps: ', count printString.

total := 0.
count := 1.
[ count <= 10 ] whileTrue: [ total := total + count. count := count + 1 ].
Transcript showCr: total printString.

count := 0.
[ count := count + 1. count < 5 ] whileTrue.
Transcript showCr: count printString.

1 to: 10 by: 3 do: [ :i | Transcript show: i printString; show: ' ' ].
Transcript cr.
10 to: 1 by: -4 do: [ :i | Transcript show: i printString; show: ' ' ].
Transcript cr.
