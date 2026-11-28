| isAutomorphic result |
isAutomorphic := [:n | (n * n) printString endsWith: n printString].

result := (0 to: 999) select: [:n | isAutomorphic value: n].
Transcript showCr: result printString. "(0 1 5 6 25 76 376 625)"
