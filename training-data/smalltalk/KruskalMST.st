Object subclass: KruskalMST [
    KruskalMST class >> find: parent x: x [
        (parent at: x) = x ifTrue: [ ^x ].
        ^self find: parent x: (parent at: x)
    ]

    KruskalMST class >> union: parent x: x y: y [
        | rootX rootY |
        rootX := self find: parent x: x.
        rootY := self find: parent x: y.
        rootX = rootY ifFalse: [ parent at: rootX put: rootY ]
    ]

    KruskalMST class >> mstFor: nodeCount edges: edges [
        | parent sorted mst |
        parent := (1 to: nodeCount) asArray copy.
        sorted := edges asSortedCollection: [ :a :b | (a at: 1) <= (b at: 1) ].
        mst := OrderedCollection new.
        sorted do: [ :edge |
            | w u v |
            w := edge at: 1.
            u := edge at: 2.
            v := edge at: 3.
            (self find: parent x: u) = (self find: parent x: v) ifFalse: [
                self union: parent x: u y: v.
                mst add: edge.
            ].
        ].
        ^mst
    ]
]

| edges result |
edges := OrderedCollection new.
edges add: #(1 1 2).
edges add: #(3 1 3).
edges add: #(4 2 3).
edges add: #(2 2 4).
edges add: #(5 3 4).

result := KruskalMST mstFor: 4 edges: edges.
Transcript showCr: result printString.
