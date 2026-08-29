Object subclass: EditDistance [
    EditDistance class >> distance: a with: b [
        | m n table cost |
        m := a size.
        n := b size.
        table := Array new: m + 1.
        0 to: m do: [ :i | table at: i + 1 put: (Array new: n + 1 withAll: 0) ].
        0 to: m do: [ :i | (table at: i + 1) at: 1 put: i ].
        0 to: n do: [ :j | (table at: 1) at: j + 1 put: j ].
        1 to: m do: [ :i |
            1 to: n do: [ :j |
                cost := ((a at: i) = (b at: j)) ifTrue: [ 0 ] ifFalse: [ 1 ].
                ((table at: i + 1) at: j + 1) put:
                    ((((table at: i) at: j + 1) + 1)
                        min: ((((table at: i + 1) at: j) + 1)
                            min: (((table at: i) at: j) + cost))).
            ].
        ].
        ^(table at: m + 1) at: n + 1
    ]
]

Transcript showCr: (EditDistance distance: 'kitten' with: 'sitting') printString.
