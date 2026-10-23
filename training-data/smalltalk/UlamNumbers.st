"Ulam numbers: after 1 and 2, the smallest number that is a sum of two
 distinct earlier terms in exactly one way"
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
                    ((terms at: a) + (terms at: b)) = cand
                        ifTrue: [ ways := ways + 1 ].
                ].
            ].
            ways = 1 ifTrue: [ terms add: cand ].
        ].
        ^terms
    ]
]

(UlamNumbers first: 15) printNl.
