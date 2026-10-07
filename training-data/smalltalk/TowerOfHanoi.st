Object subclass: Hanoi [
    | moves |
    init [ moves := 0 ]
    Hanoi class >> new [ ^super new init ]
    moves [ ^moves ]
    move: n from: a to: c via: b [
        n = 0 ifTrue: [ ^self ].
        self move: n - 1 from: a to: b via: c.
        moves := moves + 1.
        Transcript showCr: 'Move disk ', n printString, ' from ', a, ' to ', c.
        self move: n - 1 from: b to: c via: a
    ]
]

| h |
h := Hanoi new.
h move: 3 from: 'A' to: 'C' via: 'B'.
Transcript showCr: 'Total moves: ', h moves printString.
