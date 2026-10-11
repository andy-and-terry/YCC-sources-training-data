Object subclass: PriorityQueue [
    | items |

    init [
        items := SortedCollection sortBlock: [ :a :b | a key <= b key ]
    ]
    PriorityQueue class >> new [ ^super new init ]

    push: value priority: p [ items add: p -> value ]
    pop [ ^items removeFirst value ]
    isEmpty [ ^items isEmpty ]
    size [ ^items size ]
]

| pq |
pq := PriorityQueue new.
pq push: 'write code' priority: 2.
pq push: 'fix outage' priority: 0.
pq push: 'lunch' priority: 3.
pq push: 'review' priority: 1.
[ pq isEmpty ] whileFalse: [ Transcript showCr: pq pop ].
