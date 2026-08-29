Object subclass: CoinChange [
    CoinChange class >> minCoins: coins amount: amount [
        | dp |
        dp := Array new: amount + 1 withAll: -1.
        dp at: 1 put: 0.
        1 to: amount do: [ :n |
            coins do: [ :c |
                (c <= n and: [ (dp at: n - c + 1) ~= -1 ]) ifTrue: [
                    ((dp at: n + 1) = -1 or: [ (dp at: n - c + 1) + 1 < (dp at: n + 1) ])
                        ifTrue: [ dp at: n + 1 put: (dp at: n - c + 1) + 1 ].
                ].
            ].
        ].
        ^dp at: amount + 1
    ]
]

Transcript showCr: (CoinChange minCoins: #(1 2 5) amount: 11) printString.
