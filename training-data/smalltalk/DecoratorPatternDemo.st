Object subclass: SimpleCoffee [
    cost [ ^2.0 ]
    description [ ^'Coffee' ]
]

Object subclass: AddonDecorator [
    | wrapped |
    AddonDecorator class >> on: aCoffee [
        | d |
        d := super new.
        d setWrapped: aCoffee.
        ^d
    ]
    setWrapped: aCoffee [ wrapped := aCoffee ]
    cost [ ^wrapped cost ]
    description [ ^wrapped description ]
]

AddonDecorator subclass: MilkDecorator [
    cost [ ^wrapped cost + 0.5 ]
    description [ ^wrapped description, ' + Milk' ]
]

AddonDecorator subclass: SugarDecorator [
    cost [ ^wrapped cost + 0.25 ]
    description [ ^wrapped description, ' + Sugar' ]
]

| order |
order := SimpleCoffee new.
order := MilkDecorator on: order.
order := SugarDecorator on: order.
Transcript showCr: order description.
Transcript showCr: order cost printString.
