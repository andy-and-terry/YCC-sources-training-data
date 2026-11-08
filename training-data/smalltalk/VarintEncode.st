Object subclass: Varint [
    Varint class >> encode: anInteger [
        | n out |
        n := anInteger.
        out := OrderedCollection new.
        [n >= 128] whileTrue: [
            out add: ((n \\ 128) bitOr: 128).
            n := n // 128].
        out add: n.
        ^out
    ]
]

(Varint encode: 300) printNl.
