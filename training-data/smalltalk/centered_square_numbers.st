"Centered square numbers: n^2 + (n+1)^2."
0 to: 9 do: [ :n |
    Transcript show: ((n * n) + ((n + 1) * (n + 1))) printString; show: ' ' ].
Transcript cr.
