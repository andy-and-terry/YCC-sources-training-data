Object subclass: BubbleSort [
    BubbleSort class >> sort: arr [
        | a temp |
        a := arr copy.
        1 to: a size - 1 do: [ :i |
            1 to: a size - i do: [ :j |
                (a at: j) > (a at: j + 1) ifTrue: [
                    temp := a at: j.
                    a at: j put: (a at: j + 1).
                    a at: j + 1 put: temp.
                ]
            ]
        ].
        ^a
    ]
]

Transcript showCr: (BubbleSort sort: #(5 2 9 1 5 6)) printString.
