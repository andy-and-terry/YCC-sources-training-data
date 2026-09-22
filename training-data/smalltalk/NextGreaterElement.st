Object subclass: NextGreaterElement [
    NextGreaterElement class >> of: nums [
        | result stack n |
        n := nums size.
        result := Array new: n withAll: -1.
        stack := OrderedCollection new.
        1 to: n do: [ :i |
            [ stack notEmpty and: [ (nums at: stack last) < (nums at: i) ] ]
                whileTrue: [
                    result at: stack last put: (nums at: i).
                    stack removeLast.
                ].
            stack addLast: i.
        ].
        ^result
    ]
]

Transcript showCr: (NextGreaterElement of: #(4 5 2 25)) printString.
Transcript showCr: (NextGreaterElement of: #(13 7 6 12)) printString.
