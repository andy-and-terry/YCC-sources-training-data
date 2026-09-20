Object subclass: KruskalMST [
    KruskalMST class >> find: parent x: x [
        (parent at: x) = x ifTrue: [ ^x ].
        ^self find: parent x: (parent at: x)
    ]
    KruskalMST class >> mst: edges nodeCount: n [
        | parent sorted total rootA rootB chosen |
        parent := (1 to: n) asArray copy.
        sorted := edges asSortedCollection: [ :a :b | (a at: 3) <= (b at: 3) ].
        chosen := OrderedCollection new.
        total := 0.
        sorted do: [ :edge |
            rootA := self find: parent x: (edge at: 1).
            rootB := self find: parent x: (edge at: 2).
            rootA = rootB ifFalse: [
                parent at: rootA put: rootB.
                chosen add: edge.
                total := total + (edge at: 3).
            ]
        ].
        ^Array with: chosen with: total
    ]
]

| edges result |
edges := OrderedCollection new.
edges add: #(1 2 4); add: #(1 3 1); add: #(3 2 2);
     add: #(2 4 5); add: #(3 4 8); add: #(4 5 3).

result := KruskalMST mst: edges nodeCount: 5.
(result at: 1) do: [ :e | Transcript showCr: e printString ].
Transcript showCr: 'total weight: ', (result at: 2) printString.
