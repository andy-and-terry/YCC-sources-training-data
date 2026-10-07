Object subclass: KthLargestElement [
    KthLargestElement class >> partition: arr from: lo to: hi [
        | pivot i tmp |
        pivot := arr at: hi.
        i := lo.
        lo to: hi - 1 do: [ :j |
            (arr at: j) <= pivot ifTrue: [
                tmp := arr at: i. arr at: i put: (arr at: j). arr at: j put: tmp.
                i := i + 1.
            ].
        ].
        tmp := arr at: i. arr at: i put: (arr at: hi). arr at: hi put: tmp.
        ^i
    ]

    KthLargestElement class >> find: arr k: k [
        | n target lo hi p |
        n := arr size.
        target := n - k + 1.
        lo := 1. hi := n.
        [ true ] whileTrue: [
            p := self partition: arr from: lo to: hi.
            p = target ifTrue: [ ^arr at: p ].
            p < target ifTrue: [ lo := p + 1 ] ifFalse: [ hi := p - 1 ].
        ].
    ]
]

Transcript showCr: (KthLargestElement find: #(3 2 1 5 6 4) copy k: 2) printString.
