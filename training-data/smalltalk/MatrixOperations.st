Object subclass: MatrixOperations [
    MatrixOperations class >> transpose: matrix [
        | rows cols result |
        rows := matrix size.
        cols := (matrix at: 1) size.
        result := Array new: cols.
        1 to: cols do: [ :c |
            | row |
            row := Array new: rows.
            1 to: rows do: [ :r | row at: r put: ((matrix at: r) at: c) ].
            result at: c put: row.
        ].
        ^result
    ]
]

Transcript showCr: (MatrixOperations transpose: #(#(1 2) #(3 4))) printString.
