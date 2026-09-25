Object subclass: Box [
    | items |
    Box class >> new [
        | b |
        b := super new.
        b setItems.
        ^b
    ]
    setItems [ items := OrderedCollection new ]
    items [ ^items ]
    addItem: x [ items add: x ]
]

| original shallow deep |
original := Box new.
original addItem: 'pen'.
original addItem: 'book'.

shallow := original copy.
deep := original deepCopy.

shallow items add: 'shared-with-original'.
deep items add: 'only-in-deep'.

Transcript showCr: 'original items: ', original items printString.
Transcript showCr: 'shallow items: ', shallow items printString.
Transcript showCr: 'deep items: ', deep items printString.
