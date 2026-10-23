"Kolakoski: a sequence of 1s and 2s that describes its own run lengths"
Object subclass: KolakoskiSequence [
    KolakoskiSequence class >> first: count [
        | seq i symbol |
        seq := OrderedCollection with: 1 with: 2 with: 2.
        i := 3.
        [ seq size < count ] whileTrue: [
            symbol := i odd ifTrue: [ 1 ] ifFalse: [ 2 ].
            (seq at: i) timesRepeat: [ seq add: symbol ].
            i := i + 1.
        ].
        ^seq copyFrom: 1 to: count
    ]
]

(KolakoskiSequence first: 20) printNl.
