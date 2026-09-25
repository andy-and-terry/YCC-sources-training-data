Object subclass: MinStack [
    | items mins |
    MinStack class >> new [
        | s |
        s := super new.
        s setItems.
        ^s
    ]
    setItems [ items := OrderedCollection new. mins := OrderedCollection new ]
    isEmpty [ ^items isEmpty ]

    push: value [
        items addLast: value.
        mins isEmpty
            ifTrue: [ mins addLast: value ]
            ifFalse: [ mins addLast: (value min: mins last) ].
    ]

    pop [
        mins removeLast.
        ^items removeLast
    ]

    top [ ^items last ]
    min [ ^mins last ]
]

| stack |
stack := MinStack new.
stack push: 5.
stack push: 2.
stack push: 8.
Transcript showCr: stack min printString.
stack pop.
Transcript showCr: stack min printString.
Transcript showCr: stack top printString.
