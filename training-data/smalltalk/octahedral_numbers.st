"n(2n^2+1)/3"
| term |
term := [:n | (n * (((2 * n) * n) + 1)) // 3].
1 to: 15 do: [:n |
    Transcript showCr: n printString, ' -> ', (term value: n) printString].
