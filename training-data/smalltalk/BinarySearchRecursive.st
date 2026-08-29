Object subclass: BinarySearchRecursive [
    BinarySearchRecursive class >> search: arr low: low high: high target: target [
        | mid |
        low > high ifTrue: [ ^-1 ].
        mid := (low + high) // 2.
        (arr at: mid) = target ifTrue: [ ^mid ].
        (arr at: mid) < target
            ifTrue: [ ^self search: arr low: mid + 1 high: high target: target ]
            ifFalse: [ ^self search: arr low: low high: mid - 1 target: target ]
    ]
]

Transcript showCr: (BinarySearchRecursive search: #(1 3 5 7 9 11) low: 1 high: 6 target: 7) printString.
