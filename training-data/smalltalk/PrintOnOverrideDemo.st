Object subclass: Money [
    | cents currency |
    Money class >> cents: anInteger currency: aString [
        ^self new setCents: anInteger currency: aString
    ]
    setCents: anInteger currency: aString [
        cents := anInteger.
        currency := aString
    ]
    cents [ ^cents ]
    + other [ ^Money cents: cents + other cents currency: currency ]
    = other [ ^(other isKindOf: Money) and: [ cents = other cents ] ]
    hash [ ^cents hash ]
    printOn: aStream [
        aStream
            nextPutAll: currency;
            space;
            print: cents // 100;
            nextPut: $.;
            nextPutAll: (cents \\ 100 printPaddedWith: $0 to: 2);
            yourself
    ]
]

| a b |
a := Money cents: 1250 currency: 'USD'.
b := Money cents: 399 currency: 'USD'.
Transcript showCr: a printString.
Transcript showCr: (a + b) printString.
Transcript showCr: (a = (Money cents: 1250 currency: 'USD')) printString.
Transcript showCr: (Set new add: a; add: a; yourself) size printString.
Transcript showCr: a displayString.
Transcript showCr: (Array with: a with: b) printString.
