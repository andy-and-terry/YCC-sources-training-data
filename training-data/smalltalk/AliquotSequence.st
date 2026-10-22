"Repeatedly replace n by the sum of its proper divisors until 0"
Object subclass: AliquotSequence [
    AliquotSequence class >> from: start [
        | terms n total |
        terms := OrderedCollection with: start.
        n := start.
        [ n > 0 ] whileTrue: [
            total := 0.
            1 to: n // 2 do: [ :d | n \\ d = 0 ifTrue: [ total := total + d ] ].
            n := total.
            terms add: n.
        ].
        ^terms
    ]
]

((AliquotSequence from: 12) inject: '' into: [ :acc :each |
    acc isEmpty ifTrue: [ each printString ] ifFalse: [ acc, ' ', each printString ] ]) displayNl.
