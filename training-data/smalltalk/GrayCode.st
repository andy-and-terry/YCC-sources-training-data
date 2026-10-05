Object subclass: GrayCode [
    GrayCode class >> encode: n [
        ^n bitXor: (n bitShift: -1)
    ]

    GrayCode class >> decode: g [
        | n shifted |
        n := 0.
        shifted := g.
        [ shifted > 0 ] whileTrue: [
            n := n bitXor: shifted.
            shifted := shifted bitShift: -1 ].
        ^n
    ]
]

0 to: 7 do: [ :i |
    | g |
    g := GrayCode encode: i.
    Transcript showCr: (g printString: 2), ' -> ', (GrayCode decode: g) printString ].
