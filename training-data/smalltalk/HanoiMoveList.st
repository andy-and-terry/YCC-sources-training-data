Object subclass: Hanoi [
    Hanoi class >> moves: n from: a via: b to: c into: out [
        n = 0 ifTrue: [^out].
        self moves: n - 1 from: a via: c to: b into: out.
        out add: a, '->', c.
        self moves: n - 1 from: b via: a to: c into: out.
        ^out
    ]
]

| m |
m := Hanoi moves: 3 from: 'A' via: 'B' to: 'C' into: OrderedCollection new.
(m size printString, ': ', (m inject: '' into: [:a :e | a, e, ' '])) displayNl.
