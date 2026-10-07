Object subclass: KosarajuSCC [
    | adjacency n visited order |

    KosarajuSCC class >> componentsOf: adj nodeCount: count [
        | finder |
        finder := self new.
        finder setAdjacency: adj nodeCount: count.
        ^finder run
    ]

    setAdjacency: adj nodeCount: count [
        adjacency := adj.
        n := count.
    ]

    run [
        | transposed components |
        visited := Array new: n withAll: false.
        order := OrderedCollection new.
        1 to: n do: [ :i | (visited at: i) ifFalse: [ self fillOrder: i ] ].

        transposed := Array new: n.
        1 to: n do: [ :i |
            | row |
            row := Array new: n withAll: 0.
            1 to: n do: [ :j | row at: j put: ((adjacency at: j) at: i) ].
            transposed at: i put: row.
        ].

        visited := Array new: n withAll: false.
        components := OrderedCollection new.
        order reverseDo: [ :node |
            (visited at: node) ifFalse: [
                | component |
                component := OrderedCollection new.
                self collect: node into: component using: transposed.
                components add: component.
            ].
        ].
        ^components
    ]

    fillOrder: node [
        visited at: node put: true.
        1 to: n do: [ :neighbor |
            ((adjacency at: node) at: neighbor) = 1 and: [ (visited at: neighbor) not ]
                ifTrue: [ self fillOrder: neighbor ].
        ].
        order add: node.
    ]

    collect: node into: component using: transposed [
        visited at: node put: true.
        component add: node.
        1 to: n do: [ :neighbor |
            ((transposed at: node) at: neighbor) = 1 and: [ (visited at: neighbor) not ]
                ifTrue: [ self collect: neighbor into: component using: transposed ].
        ].
    ]
]

| adj |
adj := Array
    with: #(0 1 0 0 0)
    with: #(0 0 1 0 0)
    with: #(1 0 0 1 0)
    with: #(0 0 0 0 1)
    with: #(0 0 0 0 0).
Transcript showCr: (KosarajuSCC componentsOf: adj nodeCount: 5) printString.
