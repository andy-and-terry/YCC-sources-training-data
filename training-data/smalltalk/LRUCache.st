Object subclass: LRUCache [
    | capacity order values |
    LRUCache class >> new: cap [
        | c |
        c := super new.
        c setCapacity: cap.
        ^c
    ]

    setCapacity: cap [
        capacity := cap.
        order := OrderedCollection new.
        values := Dictionary new.
    ]

    get: key [
        (values includesKey: key) ifFalse: [ ^nil ].
        order remove: key.
        order addLast: key.
        ^values at: key
    ]

    put: key value: value [
        (values includesKey: key) ifTrue: [ order remove: key ].
        order addLast: key.
        values at: key put: value.
        order size > capacity ifTrue: [
            | evicted |
            evicted := order removeFirst.
            values removeKey: evicted.
        ].
    ]
]

| cache |
cache := LRUCache new: 2.
cache put: 1 value: 'a'.
cache put: 2 value: 'b'.
Transcript showCr: (cache get: 1) printString.
cache put: 3 value: 'c'.
Transcript showCr: (cache get: 2) printString.
Transcript showCr: (cache get: 3) printString.
