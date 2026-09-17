Object subclass: NoDiscount [
    apply: total [ ^total ]
]

Object subclass: PercentDiscount [
    | percent |
    percent: p [ percent := p ]
    apply: total [ ^total - (total * percent / 100) ]
]

Object subclass: FlatDiscount [
    | amount |
    amount: a [ amount := a ]
    apply: total [ ^(total - amount) max: 0 ]
]

Object subclass: Checkout [
    | strategy |
    strategy: s [ strategy := s ]
    total: cartTotal [ ^strategy apply: cartTotal ]
]

| checkout |
checkout := Checkout new.
checkout strategy: NoDiscount new.
Transcript showCr: (checkout total: 100) printString.

checkout strategy: (PercentDiscount new percent: 10; yourself).
Transcript showCr: (checkout total: 100) printString.

checkout strategy: (FlatDiscount new amount: 15; yourself).
Transcript showCr: (checkout total: 100) printString.
