Object subclass: ListIterator [
    | collection index |
    ListIterator class >> on: aCollection [
        | it |
        it := super new.
        it setCollection: aCollection.
        ^it
    ]

    setCollection: aCollection [
        collection := aCollection.
        index := 0.
    ]

    hasNext [ ^index < collection size ]

    next [
        index := index + 1.
        ^collection at: index
    ]
]

| it total |
it := ListIterator on: #(10 20 30 40).
total := 0.
[ it hasNext ] whileTrue: [ total := total + it next ].
Transcript showCr: total printString.
