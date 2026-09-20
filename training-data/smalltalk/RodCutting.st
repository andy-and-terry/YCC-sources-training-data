Object subclass: RodCutting [
    RodCutting class >> maxProfit: prices length: length [
        | dp best |
        dp := Array new: length + 1 withAll: 0.
        1 to: length do: [ :len |
            best := 0.
            1 to: len do: [ :cut |
                best := best max: (prices at: cut) + (dp at: len - cut + 1).
            ].
            dp at: len + 1 put: best.
        ].
        ^dp at: length + 1
    ]
]

Transcript showCr: (RodCutting maxProfit: #(1 5 8 9 10 17 17 20) length: 8) printString.
