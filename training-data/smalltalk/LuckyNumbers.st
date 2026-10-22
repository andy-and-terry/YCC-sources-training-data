"Start with odds, then delete every k-th survivor for each surviving k"
Object subclass: LuckyNumbers [
    LuckyNumbers class >> upTo: limit [
        | nums kept i step |
        nums := (1 to: limit by: 2) asOrderedCollection.
        i := 2.
        [ i <= nums size and: [ (nums at: i) <= nums size ] ] whileTrue: [
            step := nums at: i.
            kept := OrderedCollection new.
            nums doWithIndex: [ :each :idx | idx \\ step = 0 ifFalse: [ kept add: each ] ].
            nums := kept.
            i := i + 1.
        ].
        ^nums
    ]
]

((LuckyNumbers upTo: 50) inject: '' into: [ :acc :each |
    acc isEmpty ifTrue: [ each printString ] ifFalse: [ acc, ' ', each printString ] ]) displayNl.
