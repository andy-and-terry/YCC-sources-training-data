"Lazy caterer sequence: max pieces from n cuts"
| term |
term := [:n | ((n * (n + 1)) // 2) + 1].

0 to: 9 do: [:n | Transcript show: (term value: n) printString; show: ' '].
Transcript cr.
