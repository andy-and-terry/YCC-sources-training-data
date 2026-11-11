"Highest value reached by the Collatz (hailstone) sequence from n."
| peak |
peak := [:start | | n best |
    n := start.
    best := n.
    [n = 1] whileFalse: [
        n := n even ifTrue: [n // 2] ifFalse: [3 * n + 1].
        best := best max: n].
    best].
Transcript showCr: (peak value: 27) printString.
