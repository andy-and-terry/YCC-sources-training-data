"Cantor pairing function and its inverse."
| pair unpair w y |
pair := [ :x :yy | ((x + yy) * (x + yy + 1) // 2) + yy ].
unpair := [ :z | | ww yv |
    ww := ((8 * z + 1) sqrtFloor - 1) // 2.
    yv := z - (ww * (ww + 1) // 2).
    Array with: ww - yv with: yv ].

Transcript showCr: (pair value: 3 value: 4) printString.
w := unpair value: 32.
Transcript showCr: (w at: 1) printString, ' ', (w at: 2) printString.
