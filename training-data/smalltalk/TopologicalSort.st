Object subclass: TopologicalSort [
    TopologicalSort class >> visit: node graph: graph visited: visited order: order [
        (visited includes: node) ifTrue: [ ^self ].
        visited add: node.
        (graph at: node ifAbsent: [ #() ]) do: [ :dep |
            self visit: dep graph: graph visited: visited order: order.
        ].
        order add: node.
    ]

    TopologicalSort class >> sort: graph [
        | visited order |
        visited := OrderedCollection new.
        order := OrderedCollection new.
        graph keysDo: [ :node | self visit: node graph: graph visited: visited order: order ].
        ^order
    ]
]

| graph |
graph := Dictionary new.
graph at: 'a' put: #('b' 'c').
graph at: 'b' put: #('d').
graph at: 'c' put: #('d').
graph at: 'd' put: #().
Transcript showCr: (TopologicalSort sort: graph) printString.
