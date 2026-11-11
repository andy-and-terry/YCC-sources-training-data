"Centered square numbers 2n(n+1)+1"
| term |
term := [:n | ((2 * n) * (n + 1)) + 1].

0 to: 9 do: [:n | Transcript show: (term value: n) printString; show: ' '].
Transcript cr.
