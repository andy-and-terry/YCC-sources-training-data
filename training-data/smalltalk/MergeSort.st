Object subclass: MergeSort [
    MergeSort class >> merge: left with: right [
        | result i j |
        result := OrderedCollection new.
        i := 1. j := 1.
        [ i <= left size and: [ j <= right size ] ] whileTrue: [
            (left at: i) <= (right at: j)
                ifTrue: [ result add: (left at: i). i := i + 1. ]
                ifFalse: [ result add: (right at: j). j := j + 1. ].
        ].
        i to: left size do: [ :k | result add: (left at: k) ].
        j to: right size do: [ :k | result add: (right at: k) ].
        ^result
    ]

    MergeSort class >> sort: items [
        | mid left right |
        items size <= 1 ifTrue: [ ^items ].
        mid := items size // 2.
        left := items copyFrom: 1 to: mid.
        right := items copyFrom: mid + 1 to: items size.
        ^self merge: (self sort: left) with: (self sort: right)
    ]
]

Transcript showCr: (MergeSort sort: #(5 2 9 1 5 6)) printString.
