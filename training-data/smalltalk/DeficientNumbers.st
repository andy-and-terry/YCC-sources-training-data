Object subclass: DeficientNumbers [
    DeficientNumbers class >> sigma: n [
        | s |
        s := 0.
        1 to: n do: [:d | (n \\ d) = 0 ifTrue: [s := s + d]].
        ^s
    ]
    DeficientNumbers class >> upTo: limit [
        ^(1 to: limit) select: [:n | (self sigma: n) < (2 * n)]
    ]
]

(DeficientNumbers upTo: 20) printNl.
