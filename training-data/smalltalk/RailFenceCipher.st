Object subclass: RailFenceCipher [
    RailFenceCipher class >> encode: aString rails: n [
        | rows r dir |
        rows := (1 to: n) collect: [:i | WriteStream on: String new].
        r := 1. dir := 1.
        aString do: [:ch |
            (rows at: r) nextPut: ch.
            r = 1 ifTrue: [dir := 1].
            r = n ifTrue: [dir := -1].
            r := r + dir].
        ^(rows inject: '' into: [:acc :w | acc, w contents])
    ]
]

(RailFenceCipher encode: 'WEAREDISCOVERED' rails: 3) displayNl.
