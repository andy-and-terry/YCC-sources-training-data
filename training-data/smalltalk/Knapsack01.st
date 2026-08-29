Object subclass: Knapsack01 [
    Knapsack01 class >> solve: weights values: values capacity: capacity [
        | dp |
        dp := Array new: capacity + 1 withAll: 0.
        1 to: weights size do: [ :i |
            capacity to: (weights at: i) by: -1 do: [ :cap |
                dp at: cap + 1 put: ((dp at: cap + 1) max: (dp at: cap - (weights at: i) + 1) + (values at: i)).
            ].
        ].
        ^dp at: capacity + 1
    ]
]

Transcript showCr: (Knapsack01 solve: #(2 3 4 5) values: #(3 4 5 6) capacity: 5) printString.
