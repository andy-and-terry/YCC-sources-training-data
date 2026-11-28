Object subclass: HammingWeight [
    HammingWeight class >> popcount: anInteger [
        | n c |
        n := anInteger.
        c := 0.
        [n = 0] whileFalse: [
            n := n bitAnd: n - 1.
            c := c + 1].
        ^c
    ]
]

(HammingWeight popcount: 183) printNl.
