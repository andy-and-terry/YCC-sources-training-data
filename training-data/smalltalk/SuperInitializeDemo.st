Object subclass: Vehicle [
    | wheels name |

    Vehicle class >> new [
        ^super new init
    ]

    init [
        wheels := 4.
        name := 'vehicle'
    ]

    wheels [ ^wheels ]
    name [ ^name ]

    describe [
        ^name, ' with ', wheels printString, ' wheels'
    ]
]

Vehicle subclass: Motorbike [
    | hasSidecar |

    init [
        super init.
        wheels := 2.
        name := 'motorbike'.
        hasSidecar := false
    ]

    addSidecar [
        hasSidecar := true.
        wheels := 3
    ]

    describe [
        ^super describe, (hasSidecar ifTrue: [ ' (sidecar)' ] ifFalse: [ '' ])
    ]
]

| v m |
v := Vehicle new.
m := Motorbike new.
Transcript showCr: v describe.
Transcript showCr: m describe.
m addSidecar.
Transcript showCr: m describe.
Transcript showCr: (m isKindOf: Vehicle) printString.
Transcript showCr: m class superclass name.
