"Pernicious numbers: the popcount is prime."
| isPrime popcount |
isPrime := [ :n |
    n >= 2 and: [ ((2 to: n - 1) select: [ :d | (d * d) <= n ])
                      allSatisfy: [ :d | (n \\ d) ~= 0 ] ] ].

popcount := [ :n | | m c |
    m := n. c := 0.
    [ m > 0 ] whileTrue: [ c := c + (m \\ 2). m := m // 2 ].
    c ].

1 to: 20 do: [ :n |
    (isPrime value: (popcount value: n))
        ifTrue: [ Transcript show: n printString; show: ' ' ] ].
Transcript cr.
