Object subclass: QNode [
    | value next |
    value [ ^value ]
    value: v [ value := v ]
    next [ ^next ]
    next: n [ next := n ]
]

Object subclass: LinkedQueue [
    | head tail size |

    init [ size := 0 ]
    LinkedQueue class >> new [ ^super new init ]

    enqueue: v [
        | node |
        node := QNode new value: v; yourself.
        tail isNil ifTrue: [ head := node ] ifFalse: [ tail next: node ].
        tail := node.
        size := size + 1.
        ^v
    ]

    dequeue [
        | v |
        head isNil ifTrue: [ ^self error: 'queue empty' ].
        v := head value.
        head := head next.
        head isNil ifTrue: [ tail := nil ].
        size := size - 1.
        ^v
    ]

    size [ ^size ]
    isEmpty [ ^size = 0 ]
]

| q |
q := LinkedQueue new.
q enqueue: 'a'; enqueue: 'b'; enqueue: 'c'.
Transcript showCr: q dequeue.
Transcript showCr: q size printString.
Transcript showCr: q dequeue; showCr: q dequeue.
Transcript showCr: q isEmpty printString.
