Object subclass: HouseRobber [
    HouseRobber class >> maxLoot: amounts [
        | prev prev2 current |
        prev := 0.
        prev2 := 0.
        amounts do: [ :amount |
            current := prev max: (prev2 + amount).
            prev2 := prev.
            prev := current.
        ].
        ^prev
    ]
]

Transcript showCr: (HouseRobber maxLoot: #(2 7 9 3 1)) printString.
Transcript showCr: (HouseRobber maxLoot: #(2 1 1 2)) printString.
