"Hofstadter Q: Q(1) = Q(2) = 1, Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2))"
Object subclass: HofstadterQSequence [
    HofstadterQSequence class >> first: count [
        | q |
        q := OrderedCollection with: 1 with: 1.
        3 to: count do: [ :n |
            q add: (q at: n - (q at: n - 1)) + (q at: n - (q at: n - 2)).
        ].
        ^q
    ]
]

(HofstadterQSequence first: 20) printNl.
