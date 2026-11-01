"Consecutive n, n+1 with equal sums of prime factors (with multiplicity)."
| sopfr |
sopfr := [ :start | | n p total |
    n := start. p := 2. total := 0.
    [ (p * p) <= n ] whileTrue: [
        [ (n \\ p) = 0 ] whileTrue: [ total := total + p. n := n // p ].
        p := p + 1 ].
    n > 1 ifTrue: [ total := total + n ].
    total ].

2 to: 109 do: [ :n |
    (sopfr value: n) = (sopfr value: n + 1)
        ifTrue: [ Transcript show: n printString; show: ' ' ] ].
Transcript cr.
