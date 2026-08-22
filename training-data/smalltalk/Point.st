Object subclass: MyPoint [
    |x y|

    x: ax y: ay [ x := ax. y := ay ]

    x [ ^x ]
    y [ ^y ]

    + other [
        ^MyPoint new x: x + other x y: y + other y
    ]

    printOn: aStream [
        aStream nextPutAll: '(', x printString, ', ', y printString, ')'
    ]
]

|p1 p2 p3|
p1 := MyPoint new x: 1 y: 2.
p2 := MyPoint new x: 3 y: 4.
p3 := p1 + p2.
Transcript showCr: p3 printString.
