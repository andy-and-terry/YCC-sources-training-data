Object subclass: PercentOffStrategy [
    | percent |
    PercentOffStrategy class >> of: p [
        | s |
        s := super new.
        s setPercent: p.
        ^s
    ]
    setPercent: p [ percent := p ]
    applyTo: price [ ^price - (price * percent / 100) ]
]

Object subclass: FlatOffStrategy [
    | amount |
    FlatOffStrategy class >> of: a [
        | s |
        s := super new.
        s setAmount: a.
        ^s
    ]
    setAmount: a [ amount := a ]
    applyTo: price [ ^(price - amount) max: 0 ]
]

Object subclass: Checkout [
    | strategy |
    strategy: s [ strategy := s ]
    total: price [ ^strategy applyTo: price ]
]

| checkout |
checkout := Checkout new.
checkout strategy: (PercentOffStrategy of: 10).
Transcript showCr: (checkout total: 100) printString.
checkout strategy: (FlatOffStrategy of: 15).
Transcript showCr: (checkout total: 100) printString.
