Object subclass: RefactorableNumbers [
    RefactorableNumbers class >> tau: n [
        ^(1 to: n) inject: 0 into: [:c :d | n \\ d = 0 ifTrue: [c + 1] ifFalse: [c]]
    ]
]

((1 to: 59) select: [:n | n \\ (RefactorableNumbers tau: n) = 0]) printNl.   "(1 2 8 9 12 18 24 36 40 56 )"
