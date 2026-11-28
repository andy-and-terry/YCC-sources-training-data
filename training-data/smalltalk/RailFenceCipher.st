Object subclass: RailFenceCipher [
    RailFenceCipher class >> encrypt: text rails: k [
        | cycle rails |
        cycle := 2 * (k - 1).
        rails := (1 to: k) collect: [:i | WriteStream on: String new].
        text doWithIndex: [:ch :i |
            | r |
            r := (i - 1) \\ cycle.
            r >= k ifTrue: [r := cycle - r].
            (rails at: r + 1) nextPut: ch].
        ^(rails inject: '' into: [:acc :ws | acc, ws contents])
    ]
]

(RailFenceCipher encrypt: 'WEAREDISCOVERED' rails: 3) displayNl.
