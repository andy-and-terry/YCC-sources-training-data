"Pentagonal numbers: n(3n-1)/2."
1 to: 10 do: [ :n |
    Transcript show: (n * (3 * n - 1) // 2) printString; show: ' ' ].
Transcript cr.
