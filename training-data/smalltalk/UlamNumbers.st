"Next term: smallest value with exactly one representation as a sum of two distinct terms"
Object subclass: UlamNumbers [
    UlamNumbers class >> first: count [
        | terms cand ways |
        terms := OrderedCollection with: 1 with: 2.
        cand := 2.
        [ terms size < count ] whileTrue: [
            cand := cand + 1.
            ways := 0.
            1 to: terms size do: [ :a |
                a + 1 to: terms size do: [ :b |
                    ((terms at: a) + (terms at: b)) = cand ifTrue: [ ways := ways + 1 ] ] ].
            ways = 1 ifTrue: [ terms add: cand ].
        ].
        ^terms
    ]
]

((UlamNumbers first: 15) inject: '' into: [ :acc :each |
    acc isEmpty ifTrue: [ each printString ] ifFalse: [ acc, ' ', each printString ] ]) displayNl.
