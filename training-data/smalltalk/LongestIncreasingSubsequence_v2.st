Object subclass: LongestIncreasingSubsequence [
    LongestIncreasingSubsequence class >> lengthOf: arr [
        | n dp best |
        n := arr size.
        n = 0 ifTrue: [ ^0 ].
        dp := Array new: n withAll: 1.
        2 to: n do: [ :i |
            1 to: i - 1 do: [ :j |
                ((arr at: j) < (arr at: i) and: [ (dp at: j) + 1 > (dp at: i) ])
                    ifTrue: [ dp at: i put: (dp at: j) + 1 ]
            ]
        ].
        best := 0.
        dp do: [ :v | v > best ifTrue: [ best := v ] ].
        ^best
    ]
]

Transcript showCr: (LongestIncreasingSubsequence lengthOf: #(10 9 2 5 3 7 101 18)) printString.
Transcript showCr: (LongestIncreasingSubsequence lengthOf: #(0 1 0 3 2 3)) printString.
