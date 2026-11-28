Object subclass: ChebyshevDistance [
    ChebyshevDistance class >> between: a and: b [
        | m |
        m := 0.
        a with: b do: [:x :y | m := m max: (x - y) abs].
        ^m
    ]
]

(ChebyshevDistance between: #(1 2) and: #(4 6)) printNl.
