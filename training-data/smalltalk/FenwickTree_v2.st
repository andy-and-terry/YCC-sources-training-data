Object subclass: FenwickTree [
    | tree size |
    FenwickTree class >> onSize: n [
        | t |
        t := super new.
        t initSize: n.
        ^t
    ]

    initSize: n [
        size := n.
        tree := Array new: n + 1 withAll: 0.
    ]

    update: index delta: delta [
        | i |
        i := index + 1.
        [ i <= size ] whileTrue: [
            tree at: i put: (tree at: i) + delta.
            i := i + (i bitAnd: i negated).
        ]
    ]

    prefixSum: index [
        | i sum |
        i := index + 1.
        sum := 0.
        [ i > 0 ] whileTrue: [
            sum := sum + (tree at: i).
            i := i - (i bitAnd: i negated).
        ].
        ^sum
    ]

    rangeSum: l to: r [
        ^(self prefixSum: r) - (l = 0 ifTrue: [ 0 ] ifFalse: [ self prefixSum: l - 1 ])
    ]
]

| ft values |
ft := FenwickTree onSize: 6.
values := #(1 3 5 7 9 11).
1 to: values size do: [ :i | ft update: i - 1 delta: (values at: i) ].
Transcript showCr: (ft prefixSum: 3) printString.
Transcript showCr: (ft rangeSum: 1 to: 4) printString.
