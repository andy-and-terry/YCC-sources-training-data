Object subclass: Finder [
    firstNegativeIn: aCollection [
        aCollection do: [ :each |
            each < 0 ifTrue: [ ^each ] ].
        ^nil
    ]

    indexOfFirst: aBlock in: aCollection [
        aCollection doWithIndex: [ :each :i |
            (aBlock value: each) ifTrue: [ ^i ] ].
        ^0
    ]

    sumUntilZero: aCollection [
        | total |
        total := 0.
        aCollection do: [ :n |
            n = 0 ifTrue: [ ^total ].
            total := total + n ].
        ^total
    ]

    makeEscape [
        ^[ :x | ^x ]
    ]
]

| f |
f := Finder new.
Transcript showCr: (f firstNegativeIn: #(3 5 -2 7 -9)) printString.
Transcript showCr: (f firstNegativeIn: #(1 2 3)) printString.
Transcript showCr: (f indexOfFirst: [ :x | x > 10 ] in: #(4 11 20)) printString.
Transcript showCr: (f sumUntilZero: #(5 6 0 100)) printString.
Transcript showCr: (f sumUntilZero: #(5 6)) printString.
