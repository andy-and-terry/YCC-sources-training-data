"Van Eck: next term is the distance since the last term previously appeared, else 0"
Object subclass: VanEckSequence [
    VanEckSequence class >> first: count [
        | seq next |
        seq := OrderedCollection with: 0.
        2 to: count do: [ :n |
            next := 0.
            (n - 2) to: 1 by: -1 do: [ :k |
                (next = 0 and: [ (seq at: k) = (seq at: n - 1) ])
                    ifTrue: [ next := n - 1 - k ].
            ].
            seq add: next.
        ].
        ^seq
    ]
]

(VanEckSequence first: 20) printNl.
