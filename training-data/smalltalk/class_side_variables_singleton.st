Object subclass: Config [
    Config class [ | instance | ]
    Config class >> instance [ ^instance ifNil: [instance := self new init] ]
    | settings |
    init [ settings := Dictionary new ]
    at: key put: value [ ^settings at: key put: value ]
    at: key [ ^settings at: key ifAbsent: [nil] ]
]

Object subclass: Counter [
    Counter class >> total [ ^Total ifNil: [0] ]
    Total := nil.
    increment [ Total := (Total ifNil: [0]) + 1. ^Total ]
]

| a b |
a := Config instance.
b := Config instance.
a at: #mode put: 'debug'.
Transcript showCr: (b at: #mode); showCr: (a == b) printString.
Counter new increment; increment.
Transcript showCr: Counter total printString.
Transcript showCr: Config class printString; showCr: Config category printString; showCr: Config name.
Transcript showCr: (Config selectors asSortedCollection: [:x :y | x <= y]) asArray printString.
Transcript showCr: (Config respondsTo: #instance) printString.
