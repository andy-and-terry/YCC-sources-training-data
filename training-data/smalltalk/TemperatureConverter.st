Object subclass: Temperature [
    Temperature class >> celsiusToFahrenheit: c [ ^c * 9 / 5 + 32 ]
    Temperature class >> fahrenheitToCelsius: f [ ^(f - 32) * 5 / 9 ]
    Temperature class >> celsiusToKelvin: c [ ^c + 273.15 ]
]

#(-40 0 37 100) do: [ :c |
    Transcript showCr: c printString, ' C = ',
        (Temperature celsiusToFahrenheit: c) printString, ' F' ].

Transcript showCr: (Temperature fahrenheitToCelsius: 212) printString.
Transcript showCr: (Temperature fahrenheitToCelsius: 100) printString.
Transcript showCr: (Temperature celsiusToKelvin: 25) printString.
