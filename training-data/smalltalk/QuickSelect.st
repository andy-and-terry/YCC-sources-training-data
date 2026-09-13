Object subclass: QuickSelect [
    QuickSelect class >> partition: anArray low: low high: high [
        | pivot i temp |
        pivot := anArray at: high.
        i := low.
        low to: high - 1 do: [ :j |
            (anArray at: j) < pivot ifTrue: [
                temp := anArray at: i.
                anArray at: i put: (anArray at: j).
                anArray at: j put: temp.
                i := i + 1
            ]
        ].
        temp := anArray at: i.
        anArray at: i put: (anArray at: high).
        anArray at: high put: temp.
        ^i
    ]

    QuickSelect class >> select: anArray low: low high: high k: k [
        | pivotIndex |
        low = high ifTrue: [ ^anArray at: low ].
        pivotIndex := self partition: anArray low: low high: high.
        k = pivotIndex ifTrue: [ ^anArray at: pivotIndex ].
        k < pivotIndex
            ifTrue: [ ^self select: anArray low: low high: pivotIndex - 1 k: k ]
            ifFalse: [ ^self select: anArray low: pivotIndex + 1 high: high k: k ]
    ]

    QuickSelect class >> kthSmallest: anArray k: k [
        | copy |
        copy := anArray copy.
        ^self select: copy low: 1 high: copy size k: k
    ]
]

Transcript showCr: (QuickSelect kthSmallest: #(7 10 4 3 20 15) k: 3) printString.
Transcript showCr: (QuickSelect kthSmallest: #(7 10 4 3 20 15) k: 1) printString.
