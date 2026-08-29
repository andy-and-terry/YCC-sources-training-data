Object subclass: NQueens [
    NQueens class >> isSafe: queens col: col [
        | dist |
        1 to: queens size do: [ :i |
            dist := queens size - i + 1.
            ((queens at: i) = col or: [ ((queens at: i) - col) abs = dist ]) ifTrue: [ ^false ].
        ].
        ^true
    ]

    NQueens class >> solve: queens n: n [
        | count |
        queens size = n ifTrue: [ ^1 ].
        count := 0.
        0 to: n - 1 do: [ :col |
            (self isSafe: queens col: col) ifTrue: [
                count := count + (self solve: (queens copyWith: col) n: n).
            ].
        ].
        ^count
    ]
]

Transcript showCr: (NQueens solve: #() n: 6) printString.
