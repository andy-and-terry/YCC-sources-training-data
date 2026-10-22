"Farey sequence F_n: reduced fractions in [0,1] with denominator <= n"
Object subclass: FareySequence [
    FareySequence class >> upTo: n [
        | a b c d k e f terms |
        a := 0. b := 1. c := 1. d := n.
        terms := OrderedCollection new.
        terms add: a printString, '/', b printString.
        [ c <= n ] whileTrue: [
            k := (n + b) // d.
            e := (k * c) - a.
            f := (k * d) - b.
            a := c. b := d. c := e. d := f.
            terms add: a printString, '/', b printString.
        ].
        ^terms
    ]
]

| terms |
terms := FareySequence upTo: 5.
Transcript showCr: (terms inject: '' into: [ :acc :t | acc isEmpty ifTrue: [ t ] ifFalse: [ acc, ' ', t ] ]).
