"Euler zigzag numbers via the Seidel-Entringer boustrophedon."
| row out |
row := OrderedCollection with: 1.
out := OrderedCollection with: 1.
9 timesRepeat: [
    | next |
    next := OrderedCollection with: 0.
    row reverseDo: [ :x | next add: next last + x ].
    row := next.
    out add: row last ].
Transcript showCr: (out inject: '' into: [ :acc :x | acc, x printString, ' ' ]) trimSeparators.
