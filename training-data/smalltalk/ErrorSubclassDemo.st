Error subclass: InsufficientFunds [
    | needed |
    needed [ ^needed ]
    needed: n [ needed := n ]
    messageText [ ^'need ', needed printString, ' more' ]
]

Object subclass: Wallet [
    | balance |
    init [ balance := 0 ]
    Wallet class >> new [ ^super new init ]
    deposit: n [ balance := balance + n ]
    withdraw: n [
        n > balance ifTrue: [ ^InsufficientFunds new needed: n - balance; signal ].
        balance := balance - n
    ]
    balance [ ^balance ]
]

| w |
w := Wallet new.
w deposit: 50.
w withdraw: 20.
Transcript showCr: w balance printString.
[ w withdraw: 100 ] on: InsufficientFunds do: [ :e |
    Transcript showCr: 'caught: ', e messageText.
    e return ].
Transcript showCr: w balance printString.
