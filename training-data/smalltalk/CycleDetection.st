Object subclass: CycleDetection [
    | adjacency n state |

    CycleDetection class >> hasCycle: adj nodeCount: count [
        | detector |
        detector := self new.
        detector setAdjacency: adj nodeCount: count.
        ^detector run
    ]

    setAdjacency: adj nodeCount: count [
        adjacency := adj.
        n := count.
        state := Array new: n withAll: 0.
    ]

    run [
        1 to: n do: [ :i |
            (state at: i) = 0 ifTrue: [
                (self visit: i) ifTrue: [ ^true ].
            ].
        ].
        ^false
    ]

    visit: node [
        state at: node put: 1.
        1 to: n do: [ :neighbor |
            ((adjacency at: node) at: neighbor) = 1 ifTrue: [
                (state at: neighbor) = 1 ifTrue: [ ^true ].
                ((state at: neighbor) = 0 and: [ self visit: neighbor ]) ifTrue: [ ^true ].
            ].
        ].
        state at: node put: 2.
        ^false
    ]
]

| cyclic acyclic |
cyclic := Array with: #(0 1 0) with: #(0 0 1) with: #(1 0 0).
acyclic := Array with: #(0 1 0) with: #(0 0 1) with: #(0 0 0).
Transcript showCr: (CycleDetection hasCycle: cyclic nodeCount: 3) printString.
Transcript showCr: (CycleDetection hasCycle: acyclic nodeCount: 3) printString.
