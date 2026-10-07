Object subclass: PrimMST [
    PrimMST class >> build: adjacency nodeCount: n [
        | inTree key parent mst minKey u |
        inTree := Array new: n withAll: false.
        key := Array new: n withAll: 999999.
        parent := Array new: n withAll: 0.
        key at: 1 put: 0.
        mst := OrderedCollection new.

        n timesRepeat: [
            minKey := 999999. u := 0.
            1 to: n do: [ :v |
                ((inTree at: v) not and: [ (key at: v) < minKey ])
                    ifTrue: [ minKey := key at: v. u := v ].
            ].
            inTree at: u put: true.
            (parent at: u) > 0 ifTrue: [
                mst add: (Array with: (parent at: u) with: u with: ((adjacency at: (parent at: u)) at: u)).
            ].
            1 to: n do: [ :v |
                | w |
                w := (adjacency at: u) at: v.
                (w > 0 and: [ (inTree at: v) not and: [ w < (key at: v) ] ])
                    ifTrue: [ key at: v put: w. parent at: v put: u ].
            ].
        ].
        ^mst
    ]
]

| adj |
adj := Array
    with: #(0 2 0 6)
    with: #(2 0 3 8)
    with: #(0 3 0 5)
    with: #(6 8 5 0).
Transcript showCr: (PrimMST build: adj nodeCount: 4) printString.
