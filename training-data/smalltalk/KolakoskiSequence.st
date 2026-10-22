"Kolakoski over {1, 2}: the run lengths of the sequence describe itself"
Object subclass: KolakoskiSequence [
    KolakoskiSequence class >> first: count [
        | terms idx sym |
        terms := OrderedCollection with: 1 with: 2 with: 2.
        idx := 3.
        [ terms size < count ] whileTrue: [
            sym := 3 - terms last.
            (terms at: idx) timesRepeat: [ terms add: sym ].
            idx := idx + 1.
        ].
        ^terms copyFrom: 1 to: count
    ]
]

((KolakoskiSequence first: 20) inject: '' into: [ :acc :each |
    acc isEmpty ifTrue: [ each printString ] ifFalse: [ acc, ' ', each printString ] ]) displayNl.
