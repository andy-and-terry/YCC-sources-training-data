Object subclass: TwoSum [
    TwoSum class >> find: nums target: target [
        | seen complement |
        seen := Dictionary new.
        1 to: nums size do: [ :i |
            complement := target - (nums at: i).
            (seen includesKey: complement) ifTrue: [
                ^Array with: (seen at: complement) with: i
            ].
            seen at: (nums at: i) put: i.
        ].
        ^nil
    ]
]

Transcript showCr: (TwoSum find: #(2 7 11 15) target: 9) printString.
