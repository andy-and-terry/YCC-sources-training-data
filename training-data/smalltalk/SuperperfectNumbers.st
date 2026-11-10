Object subclass: SuperperfectNumbers [
    SuperperfectNumbers class >> sigma: n [
        ^(1 to: n) inject: 0 into: [:s :d | n \\ d = 0 ifTrue: [s + d] ifFalse: [s]]
    ]
]

((1 to: 99) select: [:n | (SuperperfectNumbers sigma: (SuperperfectNumbers sigma: n)) = (2 * n)]) printNl.
"(2 4 16 64 )"
