Object subclass: LongestCommonSubsequence [
    LongestCommonSubsequence class >> length: a with: b [
        | m n table |
        m := a size.
        n := b size.
        table := Array new: m + 1.
        0 to: m do: [ :i | table at: i + 1 put: (Array new: n + 1 withAll: 0) ].
        1 to: m do: [ :i |
            1 to: n do: [ :j |
                (a at: i) = (b at: j)
                    ifTrue: [
                        (table at: i + 1) at: j + 1 put: (((table at: i) at: j) + 1)
                    ]
                    ifFalse: [
                        (table at: i + 1) at: j + 1 put:
                            ((((table at: i) at: j + 1))
                                max: (((table at: i + 1) at: j)))
                    ]
            ]
        ].
        ^(table at: m + 1) at: n + 1
    ]
]

Transcript showCr: (LongestCommonSubsequence length: 'abcde' with: 'ace') printString.
Transcript showCr: (LongestCommonSubsequence length: 'abc' with: 'abc') printString.
