Object subclass: AStarSearch [
    AStarSearch class >> search: adjacency heuristic: heuristic from: start to: goal nodeCount: n [
        | gScore cameFrom openSet current bestF f |
        gScore := Array new: n withAll: 999999.
        gScore at: start put: 0.
        cameFrom := Array new: n withAll: 0.
        openSet := OrderedCollection new.
        openSet add: start.

        [ openSet isEmpty ] whileFalse: [
            current := openSet first.
            bestF := (gScore at: current) + (heuristic at: current).
            openSet do: [ :node |
                f := (gScore at: node) + (heuristic at: node).
                f < bestF ifTrue: [ current := node. bestF := f ].
            ].
            current = goal ifTrue: [ ^AStarSearch reconstruct: cameFrom end: current ].
            openSet remove: current.
            1 to: n do: [ :neighbor |
                | w tentative |
                w := (adjacency at: current) at: neighbor.
                w > 0 ifTrue: [
                    tentative := (gScore at: current) + w.
                    tentative < (gScore at: neighbor) ifTrue: [
                        cameFrom at: neighbor put: current.
                        gScore at: neighbor put: tentative.
                        (openSet includes: neighbor) ifFalse: [ openSet add: neighbor ].
                    ].
                ].
            ].
        ].
        ^nil
    ]

    AStarSearch class >> reconstruct: cameFrom end: node [
        | path current |
        path := OrderedCollection new.
        current := node.
        [ current > 0 ] whileTrue: [
            path addFirst: current.
            current := cameFrom at: current.
        ].
        ^path
    ]
]

| adj heuristic |
adj := Array
    with: #(0 1 4 0)
    with: #(1 0 2 5)
    with: #(4 2 0 1)
    with: #(0 5 1 0).
heuristic := #(3 2 1 0).
Transcript showCr: (AStarSearch search: adj heuristic: heuristic from: 1 to: 4 nodeCount: 4) printString.
