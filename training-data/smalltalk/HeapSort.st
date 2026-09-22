Object subclass: HeapSort [
    HeapSort class >> siftDown: anArray from: start to: stop [
        | root child larger swap |
        root := start.
        [ (2 * root) <= stop ] whileTrue: [
            child := 2 * root.
            larger := root.
            ((anArray at: larger) < (anArray at: child))
                ifTrue: [ larger := child ].
            (child + 1 <= stop and: [ (anArray at: larger) < (anArray at: child + 1) ])
                ifTrue: [ larger := child + 1 ].
            larger = root
                ifTrue: [ ^self ]
                ifFalse: [
                    swap := anArray at: root.
                    anArray at: root put: (anArray at: larger).
                    anArray at: larger put: swap.
                    root := larger.
                ].
        ].
    ]

    HeapSort class >> sort: anArray [
        | n tmp |
        n := anArray size.
        (n // 2) to: 1 by: -1 do: [ :start | self siftDown: anArray from: start to: n ].
        n to: 2 by: -1 do: [ :stop |
            tmp := anArray at: 1.
            anArray at: 1 put: (anArray at: stop).
            anArray at: stop put: tmp.
            self siftDown: anArray from: 1 to: stop - 1.
        ].
        ^anArray
    ]
]

Transcript showCr: (HeapSort sort: #(5 3 8 1 9 2 7) copy) printString.
