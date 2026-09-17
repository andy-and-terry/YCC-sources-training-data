Object subclass: GraphBFS [
    GraphBFS class >> bfs: graph from: start [
        | visited queue order node neighbors |
        visited := Set new.
        queue := OrderedCollection new.
        order := OrderedCollection new.
        visited add: start.
        queue addLast: start.
        [ queue isEmpty ] whileFalse: [
            node := queue removeFirst.
            order add: node.
            neighbors := graph at: node ifAbsent: [ #() ].
            neighbors do: [ :n |
                (visited includes: n) ifFalse: [
                    visited add: n.
                    queue addLast: n.
                ]
            ].
        ].
        ^order
    ]
]

| graph |
graph := Dictionary new.
graph at: 1 put: #(2 3).
graph at: 2 put: #(1 4).
graph at: 3 put: #(1 4).
graph at: 4 put: #(2 3 5).
graph at: 5 put: #(4).

Transcript showCr: (GraphBFS bfs: graph from: 1) printString.
Transcript showCr: (GraphBFS bfs: graph from: 5) printString.
