Object subclass: ManhattanDistance [
    ManhattanDistance class >> between: a and: b [
        | sum |
        sum := 0.
        a with: b do: [:x :y | sum := sum + (x - y) abs].
        ^sum
    ]
]

(ManhattanDistance between: #(1 2) and: #(4 6)) printNl.
