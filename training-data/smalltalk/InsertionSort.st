Object subclass: InsertionSort [
    InsertionSort class >> sort: items [
        | arr key j |
        arr := items asOrderedCollection.
        2 to: arr size do: [ :i |
            key := arr at: i.
            j := i - 1.
            [ j >= 1 and: [ (arr at: j) > key ] ] whileTrue: [
                arr at: j + 1 put: (arr at: j).
                j := j - 1.
            ].
            arr at: j + 1 put: key.
        ].
        ^arr
    ]
]

Transcript showCr: (InsertionSort sort: #(12 11 13 5 6)) printString.
