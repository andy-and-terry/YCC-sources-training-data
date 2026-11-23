"n(n+1)(2n+1)/6"
| term |
term := [:n | ((n * (n + 1)) * ((2 * n) + 1)) // 6].
1 to: 15 do: [:n |
    Transcript showCr: n printString, ' -> ', (term value: n) printString].
