"Stern's diatomic: s(0) = 0, s(1) = 1, s(2n) = s(n), s(2n+1) = s(n) + s(n+1)"
Object subclass: SternDiatomicSequence [
    SternDiatomicSequence class >> first: count [
        | s h |
        "Smalltalk indices are 1-based, so s(n) is stored at n + 1"
        s := OrderedCollection with: 0 with: 1.
        2 to: count - 1 do: [ :n |
            h := n // 2.
            n even
                ifTrue: [ s add: (s at: h + 1) ]
                ifFalse: [ s add: (s at: h + 1) + (s at: h + 2) ].
        ].
        ^s
    ]
]

(SternDiatomicSequence first: 20) printNl.
