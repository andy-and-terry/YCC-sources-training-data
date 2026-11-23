"3n(n-1)+1"
| term |
term := [:n | ((3 * n) * (n - 1)) + 1].
1 to: 15 do: [:n |
    Transcript showCr: n printString, ' -> ', (term value: n) printString].
