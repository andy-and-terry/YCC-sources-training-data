Object subclass: FloydWarshall [
    FloydWarshall class >> run: edges n: n [
        | dist inf throughK |
        inf := 1000000.
        dist := Array new: n.
        1 to: n do: [ :i | dist at: i put: (Array new: n withAll: inf) ].
        1 to: n do: [ :i | (dist at: i) at: i put: 0 ].
        edges do: [ :e |
            (dist at: (e at: 1) + 1) at: (e at: 2) + 1 put: (e at: 3).
        ].
        1 to: n do: [ :k |
            1 to: n do: [ :i |
                1 to: n do: [ :j |
                    throughK := ((dist at: i) at: k) + ((dist at: k) at: j).
                    throughK < ((dist at: i) at: j) ifTrue: [
                        (dist at: i) at: j put: throughK.
                    ].
                ].
            ].
        ].
        ^dist
    ]
]

| edges result |
edges := OrderedCollection new.
edges add: #(0 1 3); add: #(1 2 1); add: #(0 2 10); add: #(2 3 2); add: #(1 3 7).

result := FloydWarshall run: edges n: 4.
Transcript showCr: ((result at: 1) at: 4) printString.
Transcript showCr: ((result at: 1) at: 3) printString.
