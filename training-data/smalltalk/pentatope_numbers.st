"n(n+1)(n+2)(n+3)/24"
| term |
term := [:n | (((n * (n + 1)) * (n + 2)) * (n + 3)) // 24].
1 to: 15 do: [:n |
    Transcript showCr: n printString, ' -> ', (term value: n) printString].
