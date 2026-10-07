Object subclass: Collatz [
    Collatz class >> sequenceFrom: n [
        | seq cur |
        seq := OrderedCollection with: n.
        cur := n.
        [ cur = 1 ] whileFalse: [
            cur := cur even ifTrue: [ cur // 2 ] ifFalse: [ 3 * cur + 1 ].
            seq add: cur ].
        ^seq
    ]
]

Transcript showCr: (Collatz sequenceFrom: 6) asArray printString.
Transcript showCr: (Collatz sequenceFrom: 27) size printString.
