Object subclass: BigMath [
    BigMath class >> factorial: n [
        ^n <= 1 ifTrue: [ 1 ] ifFalse: [ n * (self factorial: n - 1) ]
    ]

    BigMath class >> digitCount: n [
        ^n printString size
    ]
]

Transcript showCr: (BigMath factorial: 20) printString.
Transcript showCr: (BigMath factorial: 30) printString.
Transcript showCr: (BigMath factorial: 30) class printString.
Transcript showCr: (BigMath factorial: 5) class printString.
Transcript showCr: (BigMath digitCount: (BigMath factorial: 100)) printString.
Transcript showCr: (SmallInteger maxVal + 1) class printString.
