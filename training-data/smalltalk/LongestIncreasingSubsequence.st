Object subclass: LongestIncreasingSubsequence [
    LongestIncreasingSubsequence class >> lengthOf: nums [
        | dp best |
        nums isEmpty ifTrue: [ ^0 ].
        dp := Array new: nums size withAll: 1.
        2 to: nums size do: [ :i |
            1 to: i - 1 do: [ :j |
                ((nums at: j) < (nums at: i) and: [ (dp at: j) + 1 > (dp at: i) ])
                    ifTrue: [ dp at: i put: (dp at: j) + 1 ].
            ].
        ].
        best := 0.
        dp do: [ :v | v > best ifTrue: [ best := v ] ].
        ^best
    ]
]

Transcript showCr: (LongestIncreasingSubsequence lengthOf: #(10 9 2 5 3 7 101 18)) printString.
