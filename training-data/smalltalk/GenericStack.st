Object subclass: MyStack [
    | items |
    MyStack class >> new [
        | s |
        s := super new.
        s setItems.
        ^s
    ]
    setItems [ items := OrderedCollection new ]
    push: item [ items addLast: item ]
    pop [ ^items removeLast ]
]

| s |
s := MyStack new.
s push: 1.
s push: 2.
s push: 3.
Transcript showCr: s pop printString.
Transcript showCr: s pop printString.
