"Ways to write n as a sum of two or more consecutive positive integers."
| politeWays |
politeWays := [ :n | | ways k |
    ways := 0. k := 2.
    [ ((k * (k + 1)) // 2) <= n ] whileTrue: [
        ((n - ((k * (k - 1)) // 2)) \\ k) = 0 ifTrue: [ ways := ways + 1 ].
        k := k + 1 ].
    ways ].

1 to: 16 do: [ :n |
    Transcript show: (politeWays value: n) printString; show: ' ' ].
Transcript cr.
