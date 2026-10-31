Object subclass: SelfDescribingNumbers [
    SelfDescribingNumbers class >> isSelfDescribing: n [
        | s |
        s := n printString.
        ^(1 to: s size) allSatisfy: [:i |
            (s occurrencesOf: (Character digitValue: i - 1)) = (s at: i) digitValue]
    ]
]

#(1210 2020 21200 1211) do: [:n |
    Transcript showCr: n printString, ' ', (SelfDescribingNumbers isSelfDescribing: n) printString].
