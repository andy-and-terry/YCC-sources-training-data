Object subclass: Coffee [
    cost [ ^2 ]
    description [ ^'coffee' ]
]

Object subclass: CoffeeDecorator [
    | inner |
    inner: aCoffee [ inner := aCoffee ]
    cost [ ^inner cost ]
    description [ ^inner description ]
]

CoffeeDecorator subclass: WithMilk [
    cost [ ^inner cost + 0.5 ]
    description [ ^inner description, ' + milk' ]
]

CoffeeDecorator subclass: WithSugar [
    cost [ ^inner cost + 0.25 ]
    description [ ^inner description, ' + sugar' ]
]

| plain fancy |
plain := Coffee new.
fancy := WithSugar new inner: (WithMilk new inner: plain); yourself.

Transcript showCr: plain description, ': ', plain cost printString.
Transcript showCr: fancy description, ': ', fancy cost printString.
