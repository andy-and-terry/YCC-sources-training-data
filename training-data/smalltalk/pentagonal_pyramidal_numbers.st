"n^2(n+1)/2"
| term |
term := [:n | ((n * n) * (n + 1)) // 2].
1 to: 15 do: [:n |
    Transcript showCr: n printString, ' -> ', (term value: n) printString].
