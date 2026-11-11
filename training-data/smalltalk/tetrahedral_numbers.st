"Tetrahedral numbers n(n+1)(n+2)/6"
| term |
term := [:n | ((n * (n + 1)) * (n + 2)) // 6].

0 to: 9 do: [:n | Transcript show: (term value: n) printString; show: ' '].
Transcript cr.
