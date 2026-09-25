Error subclass: InsufficientFundsError [
    | shortfall |
    shortfall: n [ shortfall := n ]
    messageText [ ^'insufficient funds, short by ', shortfall printString ]
]

Object subclass: BankAccount [
    | balance |
    BankAccount class >> new: startingBalance [
        | b |
        b := super new.
        b setBalance: startingBalance.
        ^b
    ]
    setBalance: n [ balance := n ]
    balance [ ^balance ]
    deposit: amt [ balance := balance + amt ]
    withdraw: amt [
        amt > balance ifTrue: [
            (InsufficientFundsError new shortfall: amt - balance; yourself) signal
        ].
        balance := balance - amt.
        ^balance
    ]
]

Object subclass: CustomExceptionRetryDemo [
    CustomExceptionRetryDemo class >> withdrawWithRetries [
        | account attempts |
        account := BankAccount new: 10.
        attempts := 0.
        [ account withdraw: 50 ]
            on: InsufficientFundsError
            do: [ :e |
                attempts := attempts + 1.
                Transcript showCr: 'attempt ', attempts printString, ': ', e messageText.
                attempts < 3
                    ifTrue: [ account deposit: 5. e retry ]
                    ifFalse: [ Transcript showCr: 'giving up'. e return: -1 ]
            ].
        Transcript showCr: 'final balance: ', account balance printString.
    ]
]

CustomExceptionRetryDemo withdrawWithRetries.
