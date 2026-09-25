Object subclass: GraphDFS [
    GraphDFS class >> dfs: graph from: start [
        | visited order |
        visited := Set new.
        order := OrderedCollection new.
        self dfs: graph node: start visited: visited order: order.
        ^order
    ]

    GraphDFS class >> dfs: graph node: node visited: visited order: order [
        | neighbors |
        (visited includes: node) ifTrue: [ ^self ].
        visited add: node.
        order add: node.
        neighbors := graph at: node ifAbsent: [ #() ].
        neighbors do: [ :n | self dfs: graph node: n visited: visited order: order ]
    ]
]

| graph |
graph := Dictionary new.
graph at: 1 put: #(2 3).
graph at: 2 put: #(1 4).
graph at: 3 put: #(1 4).
graph at: 4 put: #(2 3 5).
graph at: 5 put: #(4).

Transcript showCr: (GraphDFS dfs: graph from: 1) printString.
Transcript showCr: (GraphDFS dfs: graph from: 5) printString.
