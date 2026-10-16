Object subclass: Money [
    | amount currency |

    Money class >> amount: a currency: c [
        ^self new setAmount: a currency: c
    ]

    setAmount: a currency: c [ amount := a. currency := c ]
    amount [ ^amount ]
    currency [ ^currency ]

    = other [
        ^(other isKindOf: Money) and: [
            amount = other amount and: [ currency = other currency ] ]
    ]

    hash [ ^amount hash bitXor: currency hash ]

    printOn: aStream [
        aStream << amount printString << ' ' << currency
    ]
]

| a b s |
a := Money amount: 5 currency: 'EUR'.
b := Money amount: 5 currency: 'EUR'.
Transcript showCr: (a = b) printString.
Transcript showCr: (a == b) printString.
s := Set new.
s add: a; add: b; add: (Money amount: 6 currency: 'EUR').
Transcript showCr: s size printString.
Transcript showCr: a printString.
