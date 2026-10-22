"Recaman: a(n) = a(n-1) - n if positive and unseen, else a(n-1) + n"
Object subclass: RecamanSequence [
    RecamanSequence class >> first: count [
        | terms seen cur next |
        terms := OrderedCollection with: 0.
        seen := Set with: 0.
        cur := 0.
        1 to: count - 1 do: [ :i |
            next := cur - i.
            (next < 0 or: [ seen includes: next ])
                ifTrue: [ next := cur + i ].
            seen add: next.
            terms add: next.
            cur := next.
        ].
        ^terms
    ]
]

(RecamanSequence first: 20) printNl.
