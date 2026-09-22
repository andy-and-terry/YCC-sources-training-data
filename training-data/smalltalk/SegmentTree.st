Object subclass: SegmentTree [
    | tree size |
    SegmentTree class >> onArray: anArray [
        | t |
        t := super new.
        t buildFrom: anArray.
        ^t
    ]

    buildFrom: anArray [
        size := anArray size.
        tree := Array new: 4 * size withAll: 0.
        self build: 1 start: 1 end: size source: anArray
    ]

    build: node start: start end: stop source: anArray [
        start = stop
            ifTrue: [ tree at: node put: (anArray at: start) ]
            ifFalse: [
                | mid |
                mid := (start + stop) // 2.
                self build: 2 * node start: start end: mid source: anArray.
                self build: 2 * node + 1 start: mid + 1 end: stop source: anArray.
                tree at: node put: (tree at: 2 * node) + (tree at: 2 * node + 1)
            ]
    ]

    query: node start: start end: stop left: l right: r [
        | mid |
        (r < start or: [ stop < l ]) ifTrue: [ ^0 ].
        (l <= start and: [ stop <= r ]) ifTrue: [ ^tree at: node ].
        mid := (start + stop) // 2.
        ^(self query: 2 * node start: start end: mid left: l right: r)
            + (self query: 2 * node + 1 start: mid + 1 end: stop left: l right: r)
    ]

    queryRange: l to: r [
        ^self query: 1 start: 1 end: size left: l right: r
    ]
]

| st |
st := SegmentTree onArray: #(1 3 5 7 9 11).
Transcript showCr: (st queryRange: 2 to: 4) printString.
Transcript showCr: (st queryRange: 1 to: 6) printString.
