"Golomb: G(1) = 1, G(n) = 1 + G(n - G(G(n-1)))"
Object subclass: GolombSequence [
    GolombSequence class >> first: count [
        | g |
        g := OrderedCollection with: 1.
        2 to: count do: [ :n |
            g add: 1 + (g at: n - (g at: (g at: n - 1))).
        ].
        ^g
    ]
]

(GolombSequence first: 20) printNl.
