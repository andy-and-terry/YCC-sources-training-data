Object subclass: OddCubesIdentity [
    OddCubesIdentity class >> cubeFromOdds: n [
        | start |
        start := (n * n) - n + 1.
        ^(0 to: n - 1) inject: 0 into: [:acc :i | acc + start + (2 * i)]
    ]
]

1 to: 5 do: [:n |
    Transcript showCr: n printString, ' ', (OddCubesIdentity cubeFromOdds: n) printString,
        ' ', ((OddCubesIdentity cubeFromOdds: n) = (n * n * n)) printString].
