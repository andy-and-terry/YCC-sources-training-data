Object subclass: LRUCache [
    | capacity store order |
    LRUCache class >> capacity: n [
        | c |
        c := super new.
        c setCapacity: n.
        ^c
    ]
    setCapacity: n [
        capacity := n.
        store := Dictionary new.
        order := OrderedCollection new.
    ]

    touch: key [
        order remove: key ifAbsent: [ ].
        order addLast: key.
    ]

    get: key [
        (store includesKey: key)
            ifFalse: [ ^-1 ].
        self touch: key.
        ^store at: key
    ]

    put: key value: value [
        store at: key put: value.
        self touch: key.
        order size > capacity
            ifTrue: [ | evict |
                evict := order removeFirst.
                store removeKey: evict.
            ].
    ]
]

| cache |
cache := LRUCache capacity: 2.
cache put: 1 value: 'a'.
cache put: 2 value: 'b'.
Transcript showCr: (cache get: 1) printString.
cache put: 3 value: 'c'.
Transcript showCr: (cache get: 2) printString.
Transcript showCr: (cache get: 3) printString.
