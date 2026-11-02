Object subclass: Account [
    | balance |
    init [ balance := 0 ]
    deposit: n [ balance := balance + n ]
    balance [ ^balance ]
]
| a |
a := Account new init; yourself.
a deposit: 50.
Transcript showCr: a balance printString.
