Object subclass: BellmanFord [
    BellmanFord class >> shortestPaths: edges nodeCount: n source: source [
        | dist updated |
        dist := Array new: n withAll: 999999.
        dist at: source put: 0.
        1 to: n - 1 do: [ :i |
            edges do: [ :edge |
                | u v w |
                u := edge at: 1. v := edge at: 2. w := edge at: 3.
                ((dist at: u) ~= 999999 and: [ (dist at: u) + w < (dist at: v) ])
                    ifTrue: [ dist at: v put: (dist at: u) + w ].
            ].
        ].
        updated := false.
        edges do: [ :edge |
            | u v w |
            u := edge at: 1. v := edge at: 2. w := edge at: 3.
            ((dist at: u) ~= 999999 and: [ (dist at: u) + w < (dist at: v) ])
                ifTrue: [ updated := true ].
        ].
        updated ifTrue: [ ^'negative-cycle' ].
        ^dist
    ]
]

| edges |
edges := Array
    with: #(1 2 4)
    with: #(1 3 5)
    with: #(2 3 -3)
    with: #(3 4 4)
    with: #(4 2 1).
Transcript showCr: (BellmanFord shortestPaths: edges nodeCount: 4 source: 1) printString.
