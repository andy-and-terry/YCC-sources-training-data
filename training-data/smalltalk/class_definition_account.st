Object subclass: Account [
    | balance |
    init [ balance := 0 ]
    deposit: n [ balance := balance + n ]
    balance [ ^balance ]
]

| a |
a := Account new.
a init; deposit: 50; deposit: 25.
a balance printNl.
