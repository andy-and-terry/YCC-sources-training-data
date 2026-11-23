"n(n+1)(n+2)/6"
| term |
term := [:n | ((n * (n + 1)) * (n + 2)) // 6].
1 to: 15 do: [:n |
    Transcript showCr: n printString, ' -> ', (term value: n) printString].
