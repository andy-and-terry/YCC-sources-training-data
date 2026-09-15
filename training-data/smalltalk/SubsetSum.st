Object subclass: SubsetSum [
    SubsetSum class >> canReach: target from: nums [
        | possible |
        possible := Array new: target + 1 withAll: false.
        possible at: 1 put: true.
        nums do: [ :n |
            target + 1 to: n + 1 by: -1 do: [ :s |
                ((s - n) >= 1 and: [ possible at: s - n ])
                    ifTrue: [ possible at: s put: true ].
            ].
        ].
        ^possible at: target + 1
    ]
]

Transcript showCr: (SubsetSum canReach: 9 from: #(3 34 4 12 5 2)) printString.
Transcript showCr: (SubsetSum canReach: 10 from: #(3 34 4 12 5 2)) printString.
