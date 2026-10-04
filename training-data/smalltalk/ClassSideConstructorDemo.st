Object subclass: Temperature [
    | kelvin |

    Temperature class >> fromCelsius: aNumber [
        ^self new setKelvin: aNumber + 273.15
    ]

    Temperature class >> fromFahrenheit: aNumber [
        ^self fromCelsius: (aNumber - 32) * 5 / 9
    ]

    Temperature class >> absoluteZero [
        ^self new setKelvin: 0
    ]

    setKelvin: aNumber [
        kelvin := aNumber
    ]

    kelvin [ ^kelvin ]
    celsius [ ^kelvin - 273.15 ]
    fahrenheit [ ^self celsius * 9 / 5 + 32 ]

    < other [ ^kelvin < other kelvin ]

    printOn: aStream [
        aStream nextPutAll: (self celsius roundTo: 0.01) printString; nextPutAll: ' C'
    ]
]

| boiling freezing zero |
boiling := Temperature fromCelsius: 100.
freezing := Temperature fromFahrenheit: 32.
zero := Temperature absoluteZero.

Transcript showCr: boiling printString.
Transcript showCr: freezing printString.
Transcript showCr: zero printString.
Transcript showCr: (freezing < boiling) printString.
Transcript showCr: (boiling fahrenheit roundTo: 0.01) printString.
