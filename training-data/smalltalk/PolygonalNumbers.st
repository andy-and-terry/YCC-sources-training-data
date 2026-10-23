"s-gonal number: P(s, n) = ((s - 2) * n^2 - (s - 4) * n) / 2"
Object subclass: PolygonalNumbers [
    PolygonalNumbers class >> sides: s index: n [
        ^(((s - 2) * n * n) - ((s - 4) * n)) // 2
    ]

    PolygonalNumbers class >> firstTenFor: s [
        ^(1 to: 10) collect: [ :n | self sides: s index: n ]
    ]
]

Transcript showCr: 'Triangular: ', (PolygonalNumbers firstTenFor: 3) printString.
Transcript showCr: 'Pentagonal: ', (PolygonalNumbers firstTenFor: 5) printString.
Transcript showCr: 'Hexagonal: ', (PolygonalNumbers firstTenFor: 6) printString.
