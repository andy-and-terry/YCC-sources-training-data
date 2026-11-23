"n(n+1)/2+1"
| term |
term := [:n | ((n * (n + 1)) // 2) + 1].
1 to: 15 do: [:n |
    Transcript showCr: n printString, ' -> ', (term value: n) printString].
