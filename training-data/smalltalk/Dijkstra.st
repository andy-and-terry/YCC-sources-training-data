Object subclass: Dijkstra [
    Dijkstra class >> shortestPaths: graph source: source [
        | dist visited bestNode bestDist |
        dist := Dictionary new.
        graph keysDo: [ :node | dist at: node put: 999999 ].
        dist at: source put: 0.
        visited := OrderedCollection new.

        graph size timesRepeat: [
            bestNode := nil.
            bestDist := 999999.
            dist keysAndValuesDo: [ :node :d |
                ((visited includes: node) not and: [ d < bestDist ]) ifTrue: [
                    bestNode := node.
                    bestDist := d.
                ].
            ].
            bestNode ifNotNil: [
                visited add: bestNode.
                (graph at: bestNode ifAbsent: [ #() ]) do: [ :edge |
                    | neighbor weight newDist |
                    neighbor := edge key.
                    weight := edge value.
                    newDist := bestDist + weight.
                    newDist < (dist at: neighbor) ifTrue: [ dist at: neighbor put: newDist ].
                ].
            ].
        ].
        ^dist
    ]
]

| graph |
graph := Dictionary new.
graph at: 'a' put: (Array with: 'b' -> 1 with: 'c' -> 4).
graph at: 'b' put: (Array with: 'c' -> 2 with: 'd' -> 5).
graph at: 'c' put: (Array with: 'd' -> 1).
graph at: 'd' put: #().
Transcript showCr: (Dijkstra shortestPaths: graph source: 'a') printString.
