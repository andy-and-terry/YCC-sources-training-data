| isPronic |
isPronic := [:x | | n | n := x sqrtFloor. n * (n + 1) = x].

Transcript showCr: ((0 to: 9) collect: [:n | n * (n + 1)]) printString. "(0 2 6 12 20 30 42 56 72 90)"
Transcript showCr: (isPronic value: 56) printString. "true"
Transcript showCr: (isPronic value: 57) printString. "false"
