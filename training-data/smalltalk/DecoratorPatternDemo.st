Object subclass: Beverage [
    cost [ ^self subclassResponsibility ]
    description [ ^self subclassResponsibility ]
]

Beverage subclass: Coffee [
    cost [ ^2 ]
    description [ ^'Coffee' ]
]

Beverage subclass: CondimentDecorator [
    | beverage |
    beverage: b [ beverage := b ]
]

CondimentDecorator subclass: Milk [
    cost [ ^beverage cost + 1 ]
    description [ ^beverage description, ' + Milk' ]
]

CondimentDecorator subclass: Sugar [
    cost [ ^beverage cost + (1/2) ]
    description [ ^beverage description, ' + Sugar' ]
]

| drink |
drink := Coffee new.
drink := Milk new beverage: drink; yourself.
drink := Sugar new beverage: drink; yourself.

Transcript showCr: drink description.
Transcript showCr: drink cost printString.
