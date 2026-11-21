"Perfect totient numbers: sum of the iterated totient chain down to 1 equals n."
| phi chainSum |
phi := [ :n | ((1 to: n) count: [ :k | (k gcd: n) = 1 ]) ].

chainSum := [ :n | | m total |
    m := n.
    total := 0.
    [ m > 1 ] whileTrue: [ m := phi value: m. total := total + m ].
    total ].

2 to: 199 do: [ :n |
    ((chainSum value: n) = n) ifTrue: [ Transcript show: n printString; show: ' ' ] ].
Transcript cr.
