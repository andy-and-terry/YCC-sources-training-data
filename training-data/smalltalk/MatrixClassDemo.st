Object subclass: Matrix2 [
    | rows |

    Matrix2 class >> rows: anArray [ ^self new setRows: anArray ]
    setRows: r [ rows := r ]
    rows [ ^rows ]
    at: i at: j [ ^(rows at: i) at: j ]

    * other [
        ^Matrix2 rows: ((1 to: 2) collect: [ :i |
            (1 to: 2) collect: [ :j |
                (1 to: 2) inject: 0 into: [ :acc :k |
                    acc + ((self at: i at: k) * (other at: k at: j)) ] ] ])
    ]

    transposed [
        ^Matrix2 rows: ((1 to: 2) collect: [ :j | (1 to: 2) collect: [ :i | self at: i at: j ] ])
    ]

    determinant [ ^((self at: 1 at: 1) * (self at: 2 at: 2)) - ((self at: 1 at: 2) * (self at: 2 at: 1)) ]
]

| a b |
a := Matrix2 rows: #(#(1 2) #(3 4)).
b := Matrix2 rows: #(#(0 1) #(1 0)).
Transcript showCr: (a * b) rows printString.
Transcript showCr: a transposed rows printString.
Transcript showCr: a determinant printString.
