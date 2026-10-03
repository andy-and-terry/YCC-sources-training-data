Object subclass: TrappingRainWater [
    TrappingRainWater class >> totalWater: heights [
        | n leftMax rightMax total |
        n := heights size.
        n = 0 ifTrue: [ ^0 ].
        leftMax := Array new: n.
        rightMax := Array new: n.
        leftMax at: 1 put: (heights at: 1).
        2 to: n do: [ :i | leftMax at: i put: ((leftMax at: i - 1) max: (heights at: i)) ].
        rightMax at: n put: (heights at: n).
        n - 1 to: 1 by: -1 do: [ :i | rightMax at: i put: ((rightMax at: i + 1) max: (heights at: i)) ].
        total := 0.
        1 to: n do: [ :i |
            total := total + (((leftMax at: i) min: (rightMax at: i)) - (heights at: i)).
        ].
        ^total
    ]
]

Transcript showCr: (TrappingRainWater totalWater: #(0 1 0 2 1 0 1 3 2 1 2 1)) printString.
