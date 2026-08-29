Object subclass: SelectionSort [
    SelectionSort class >> sort: items [
        | arr minIdx temp |
        arr := items asOrderedCollection.
        1 to: arr size - 1 do: [ :i |
            minIdx := i.
            i + 1 to: arr size do: [ :j |
                (arr at: j) < (arr at: minIdx) ifTrue: [ minIdx := j ].
            ].
            temp := arr at: i.
            arr at: i put: (arr at: minIdx).
            arr at: minIdx put: temp.
        ].
        ^arr
    ]
]

Transcript showCr: (SelectionSort sort: #(5 3 8 1 9 2)) printString.
