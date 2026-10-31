Object subclass: MultiplicativePersistence [
    MultiplicativePersistence class >> of: value [
        | n steps product |
        n := value. steps := 0.
        [n >= 10] whileTrue: [
            product := 1.
            n printString do: [:ch | product := product * ch digitValue].
            n := product.
            steps := steps + 1].
        ^steps
    ]
]

#(39 77 999 10) do: [:n |
    Transcript showCr: n printString, ' ', (MultiplicativePersistence of: n) printString].
