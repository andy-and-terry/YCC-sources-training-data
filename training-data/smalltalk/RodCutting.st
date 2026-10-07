Object subclass: RodCutting [
    RodCutting class >> maxRevenue: prices length: length [
        | revenue best |
        revenue := Array new: length + 1 withAll: 0.
        1 to: length do: [ :i |
            best := -1.
            1 to: i do: [ :cut |
                | candidate |
                candidate := (prices at: cut) + (revenue at: i - cut + 1).
                candidate > best ifTrue: [ best := candidate ].
            ].
            revenue at: i + 1 put: best.
        ].
        ^revenue at: length + 1
    ]
]

Transcript showCr: (RodCutting maxRevenue: #(1 5 8 9 10 17 17 20) length: 8) printString.
