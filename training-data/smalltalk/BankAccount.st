Error subclass: InsufficientFunds [
    messageText [ ^'Insufficient funds' ]
]

Object subclass: BankAccount [
    | balance |

    init [ balance := 0 ]

    BankAccount class >> new [ ^super new init ]

    balance [ ^balance ]

    deposit: amount [
        amount <= 0 ifTrue: [ ^self error: 'Invalid amount' ].
        balance := balance + amount
    ]

    withdraw: amount [
        amount > balance ifTrue: [ ^InsufficientFunds new signal ].
        balance := balance - amount
    ]
]

| acct |
acct := BankAccount new.
acct deposit: 100.
acct withdraw: 30.
Transcript showCr: 'Balance: ', acct balance printString.
[ acct withdraw: 500 ] on: InsufficientFunds do: [ :e |
    Transcript showCr: 'Error: ', e messageText ].
[ acct deposit: -5 ] on: Error do: [ :e |
    Transcript showCr: 'Error: ', e messageText ].
