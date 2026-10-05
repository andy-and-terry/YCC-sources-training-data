Object subclass: PascalsTriangle [
    PascalsTriangle class >> nextRow: row [
        | next |
        next := OrderedCollection new.
        next add: 1.
        1 to: row size - 1 do: [ :i |
            next add: (row at: i) + (row at: i + 1) ].
        next add: 1.
        ^next asArray
    ]

    PascalsTriangle class >> rows: n [
        | rows row |
        rows := OrderedCollection new.
        row := #(1).
        n timesRepeat: [
            rows add: row.
            row := self nextRow: row ].
        ^rows
    ]
]

(PascalsTriangle rows: 6) do: [ :row |
    Transcript showCr: row printString ].
