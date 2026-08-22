Object subclass: BinarySearch [
    BinarySearch class >> search: arr for: target [
        | low high mid |
        low := 1.
        high := arr size.
        [ low <= high ] whileTrue: [
            mid := (low + high) // 2.
            (arr at: mid) = target ifTrue: [ ^mid ].
            (arr at: mid) < target
                ifTrue: [ low := mid + 1 ]
                ifFalse: [ high := mid - 1 ].
        ].
        ^-1
    ]
]

Transcript showCr: (BinarySearch search: #(1 3 5 7 9 11 13) for: 7) printString.
Transcript showCr: (BinarySearch search: #(1 3 5 7 9 11 13) for: 4) printString.
