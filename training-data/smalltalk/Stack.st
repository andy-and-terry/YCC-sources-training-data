Object subclass: SimpleStack [
    |items|

    init [ items := OrderedCollection new ]

    push: item [ items addLast: item ]

    pop [ ^items removeLast ]

    peek [ ^items last ]

    isEmpty [ ^items isEmpty ]
]

|stack|
stack := SimpleStack new.
stack init.
stack push: 1.
stack push: 2.
stack push: 3.
Transcript showCr: stack pop printString, ' ', stack peek printString, ' ', stack isEmpty printString.
