Object subclass: Widget [
    | label size tags |

    init [
        tags := OrderedCollection new
    ]

    Widget class >> new [
        ^super new init
    ]

    label [ ^label ]
    size [ ^size ]
    label: aString [ label := aString ]
    tags [ ^tags ]
]

| w |
w := Widget new.
Transcript showCr: w label printString.
Transcript showCr: w size printString.
Transcript showCr: w tags printString.
w label: 'ok'.
w tags add: #red.
Transcript showCr: w label printString.
Transcript showCr: w tags printString.
