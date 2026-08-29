Object subclass: MaxSubarray [
    MaxSubarray class >> kadane: items [
        | best current |
        best := items first.
        current := items first.
        2 to: items size do: [ :i |
            current := ((items at: i) max: current + (items at: i)).
            best := best max: current.
        ].
        ^best
    ]
]

Transcript showCr: (MaxSubarray kadane: #(-2 1 -3 4 -1 2 1 -5 4)) printString.
