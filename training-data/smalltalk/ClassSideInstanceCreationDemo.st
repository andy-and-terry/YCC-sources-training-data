Object subclass: Temperature [
    | celsius |
    Temperature class >> celsius: aNumber [
        ^self new setCelsius: aNumber
    ]
    Temperature class >> fahrenheit: aNumber [
        ^self new setCelsius: (aNumber - 32) * 5 / 9
    ]
    setCelsius: aNumber [ celsius := aNumber ]
    celsius [ ^celsius ]
    fahrenheit [ ^celsius * 9 / 5 + 32 ]
    printOn: aStream [ aStream nextPutAll: celsius printString, ' C' ]
]

| t |
t := Temperature celsius: 100.
Transcript showCr: t printString.
Transcript showCr: t fahrenheit printString.
Transcript showCr: (Temperature fahrenheit: 212) printString.
Transcript showCr: (Temperature fahrenheit: 32) celsius printString.
