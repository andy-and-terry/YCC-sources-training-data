Object subclass: DeltaEncoding [
    DeltaEncoding class >> encode: xs [
        | out |
        out := OrderedCollection with: xs first.
        2 to: xs size do: [:i | out add: (xs at: i) - (xs at: i - 1)].
        ^out
    ]
    DeltaEncoding class >> decode: ds [
        | acc |
        acc := 0.
        ^ds collect: [:d | acc := acc + d]
    ]
]

| d |
d := DeltaEncoding encode: #(10 12 15 15 20).
d printNl.
(DeltaEncoding decode: d) printNl.
