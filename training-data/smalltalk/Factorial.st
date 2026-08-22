Object subclass: Factorial [
    Factorial class >> of: n [
        n <= 1 ifTrue: [ ^1 ].
        ^n * (Factorial of: n - 1)
    ]
]

Transcript showCr: (Factorial of: 5) printString.
Transcript showCr: (Factorial of: 10) printString.
