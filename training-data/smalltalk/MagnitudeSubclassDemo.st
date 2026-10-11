Magnitude subclass: Version [
    | major minor |

    Version class >> major: ma minor: mi [
        ^self new setMajor: ma minor: mi
    ]

    setMajor: ma minor: mi [ major := ma. minor := mi ]
    major [ ^major ]
    minor [ ^minor ]

    < other [
        ^major < other major or: [ major = other major and: [ minor < other minor ] ]
    ]

    = other [
        ^major = other major and: [ minor = other minor ]
    ]

    hash [ ^major * 1000 + minor ]

    printOn: aStream [ aStream << major printString << '.' << minor printString ]
]

| v1 v2 v3 |
v1 := Version major: 1 minor: 4.
v2 := Version major: 1 minor: 10.
v3 := Version major: 0 minor: 9.
Transcript showCr: (v1 < v2) printString.
Transcript showCr: (v1 > v3) printString.
Transcript showCr: (v1 max: v2) printString.
Transcript showCr: (v3 between: v3 and: v1) printString.
Transcript showCr: ((Array with: v1 with: v2 with: v3) asSortedCollection) asArray printString.
