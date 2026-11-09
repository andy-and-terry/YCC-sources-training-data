Object subclass: Temp [
    | c |
    Temp class >> celsius: x [ ^self new setC: x ]
    setC: x [ c := x ]
    fahrenheit [ ^c * 9 / 5 + 32 ]
]
(Temp celsius: 100) fahrenheit printNl.
