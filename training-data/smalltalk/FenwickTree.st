Object subclass: FenwickTree [
    | tree n |
    FenwickTree class >> new: size [
        | t |
        t := super new.
        t setSize: size.
        ^t
    ]

    setSize: size [
        n := size.
        tree := Array new: n + 1 withAll: 0.
    ]

    update: index by: delta [
        | i |
        i := index + 1.
        [ i <= n ] whileTrue: [
            tree at: i put: (tree at: i) + delta.
            i := i + (i bitAnd: i negated).
        ].
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

    rangeSum: left to: right [
        left = 0 ifTrue: [ ^self prefixSum: right ].
        ^(self prefixSum: right) - (self prefixSum: left - 1)
    ]
]

| ft values |
values := #(3 2 -1 6 5 4 -3 3 7 2).
ft := FenwickTree new: values size.
values doWithIndex: [ :v :i | ft update: i - 1 by: v ].
Transcript showCr: (ft rangeSum: 0 to: 5) printString.
Transcript showCr: (ft rangeSum: 3 to: 7) printString.
