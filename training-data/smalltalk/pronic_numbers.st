"Pronic numbers n(n+1)"
| term |
term := [:n | n * (n + 1)].

0 to: 9 do: [:n | Transcript show: (term value: n) printString; show: ' '].
Transcript cr.
