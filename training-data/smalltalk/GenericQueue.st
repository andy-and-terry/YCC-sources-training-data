Object subclass: MyQueue [
    | items |
    MyQueue class >> new [
        | q |
        q := super new.
        q setItems.
        ^q
    ]
    setItems [ items := OrderedCollection new ]
    enqueue: item [ items addLast: item ]
    dequeue [ ^items removeFirst ]
]

| q |
q := MyQueue new.
q enqueue: 1.
q enqueue: 2.
q enqueue: 3.
Transcript showCr: q dequeue printString.
Transcript showCr: q dequeue printString.
