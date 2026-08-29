Object subclass: TailRecursiveFactorial [
    TailRecursiveFactorial class >> of: n [
        | result |
        result := 1.
        1 to: n do: [ :i | result := result * i ].
        ^result
    ]
]

Transcript showCr: (TailRecursiveFactorial of: 10) printString.
