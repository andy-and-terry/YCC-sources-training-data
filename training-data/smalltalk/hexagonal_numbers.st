"Hexagonal numbers: n(2n-1)."
1 to: 10 do: [ :n |
    Transcript show: (n * (2 * n - 1)) printString; show: ' ' ].
Transcript cr.
