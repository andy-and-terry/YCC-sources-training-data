Object subclass: BipartiteCheck [
    BipartiteCheck class >> test: adjacency nodeCount: n [
        | color queue node |
        color := Array new: n withAll: 0.
        1 to: n do: [ :start |
            (color at: start) = 0 ifTrue: [
                color at: start put: 1.
                queue := OrderedCollection new.
                queue add: start.
                [ queue isEmpty ] whileFalse: [
                    node := queue removeFirst.
                    1 to: n do: [ :neighbor |
                        ((adjacency at: node) at: neighbor) = 1 ifTrue: [
                            (color at: neighbor) = 0
                                ifTrue: [
                                    color at: neighbor put: (color at: node) negated.
                                    queue add: neighbor.
                                ]
                                ifFalse: [
                                    (color at: neighbor) = (color at: node) ifTrue: [ ^false ].
                                ].
                        ].
                    ].
                ].
            ].
        ].
        ^true
    ]
]

| adj |
adj := Array
    with: #(0 1 0 1)
    with: #(1 0 1 0)
    with: #(0 1 0 1)
    with: #(1 0 1 0).
Transcript showCr: (BipartiteCheck test: adj nodeCount: 4) printString.
